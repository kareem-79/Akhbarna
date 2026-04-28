import 'dart:io';
import 'dart:ui';
import 'package:akhbarna/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EnlargableProfileAvatar extends StatelessWidget {
  final String? imageUrl;        // لو رابط نت
  final String? imagePath;       // لو صورة من الجهاز
  final double radius;
  final bool isEditable;
  final ValueChanged<String>? onImagePicked;

  const EnlargableProfileAvatar({
    super.key,
    this.imageUrl,
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

    if (pickedFile != null && onImagePicked != null) {
      onImagePicked!(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool hasImage = (imageUrl != null && imageUrl!.isNotEmpty) ||
        (imagePath != null && imagePath!.isNotEmpty);

    return GestureDetector(
      onTap: () {
        if (isEditable) {
          _pickImage(context);
        } else if (hasImage) {
          showDialog(
            context: context,
            barrierDismissible: true,
            barrierColor: Colors.transparent,
            builder: (context) => Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Container(color: Colors.black.withOpacity(0.4)),
                    ),
                  ),
                ),
                Center(
                  child: ClipOval(
                    child: InteractiveViewer(
                      minScale: 1.0,
                      maxScale: 3.0,
                      child: imagePath != null
                          ? Image.file(File(imagePath!), width: 320.r, height: 320.r, fit: BoxFit.cover)
                          : Image.network(imageUrl!, width: 320.r, height: 320.r, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
      child: CircleAvatar(
        radius: radius.r,
        backgroundImage: hasImage
            ? (imagePath != null
            ? FileImage(File(imagePath!))
            : NetworkImage(imageUrl!))
            : null,
        backgroundColor: Colors.grey[300],
        child: !hasImage
            ? Icon(Icons.person, size: radius.r * 0.7, color: Colors.white)
            : null,
      ),
    );
  }
}