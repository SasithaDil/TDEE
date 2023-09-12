
import 'package:flutter/material.dart';
import 'package:tdee/core/screen_utils.dart';

class CustomGenderButton extends StatelessWidget {
  const CustomGenderButton({
    Key? key,
    required this.onPressed,
    required this.bgColor,
    required this.buttonText,
    required this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color bgColor;
  final String buttonText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: context.mQHeight * 0.23,
        width: context.mQWidth * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 0.08,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                semanticLabel: buttonText,
                size: context.mQWidth * 0.2,
              ),
              Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}