import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPress,
    required this.text, this.color,
  });

  final VoidCallback onPress;
  final String text;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onPress,
      child: Text(
          text,
          style: textTheme.bodySmall?.copyWith(
            color: color,
          )
      ),
    );
  }
}
