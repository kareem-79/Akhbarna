import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EnlargableProfileAvatar extends StatelessWidget {
  final String? imagePath;
  final double radius;
  final bool isEditable;
  final ValueChanged<String>? onImagePicked;

  const EnlargableProfileAvatar({
    super.key,
    this.imagePath,
    this.radius = 80,
    this.isEditable = false,
    this.onImagePicked,
  });

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();

    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      onImagePicked?.call(pickedFile.path);
    }
  }

  bool get _hasImage => imagePath != null && imagePath!.trim().isNotEmpty;

  bool get _isNetworkImage =>
      _hasImage &&
      (imagePath!.startsWith("http://") || imagePath!.startsWith("https://"));

  @override
  Widget build(BuildContext context) {
    ImageProvider? provider;

    if (_hasImage) {
      if (_isNetworkImage) {
        provider = NetworkImage(imagePath!);
      } else {
        provider = FileImage(File(imagePath!));
      }
    }

    return GestureDetector(
      onTap: () {
        if (isEditable) {
          _pickImage(context);
          return;
        }

        if (!_hasImage) return;

        showDialog(
          context: context,
          barrierDismissible: true,
          barrierColor: Colors.transparent,
          builder: (_) => Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(color: Colors.black.withOpacity(.4)),
                  ),
                ),
              ),
              Center(
                child: ClipOval(
                  child: InteractiveViewer(
                    minScale: 1,
                    maxScale: 4,
                    child: _isNetworkImage
                        ? Image.network(
                            imagePath!,
                            width: 320.r,
                            height: 320.r,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(imagePath!),
                            width: 320.r,
                            height: 320.r,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      child: CircleAvatar(
        radius: radius.r,
        backgroundColor: Colors.grey.shade300,
        backgroundImage: provider,
        child: provider == null
            ? Icon(Icons.person, size: radius.r * .7, color: Colors.white)
            : null,
      ),
    );
  }
}
