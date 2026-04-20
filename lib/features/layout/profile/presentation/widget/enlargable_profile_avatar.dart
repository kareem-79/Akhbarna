import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnlargableProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final VoidCallback? onTap;

  const EnlargableProfileAvatar({
    super.key,
    required this.imageUrl,
    this.radius = 80,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
              () {
            showDialog(
              context: context,
              barrierDismissible: true,
              barrierColor: Colors.transparent,
              builder: (context) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                          child: Container(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: ClipOval(
                        child: InteractiveViewer(
                          minScale: 1.0,
                          maxScale: 3.0,
                          child: Image.network(
                            imageUrl,
                            width: 300.w,
                            height: 300.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
      child: CircleAvatar(
        radius: radius.r,
        backgroundImage: NetworkImage(imageUrl),
        backgroundColor: Colors.grey[300],
        child: imageUrl.isEmpty
            ? const Icon(Icons.person, size: 50, color: Colors.white)
            : null,
      ),
    );
  }
}