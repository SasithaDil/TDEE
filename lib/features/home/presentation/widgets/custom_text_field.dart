import 'package:flutter/material.dart';

import 'package:tdee/core/screen_utils.dart';
import 'package:tdee/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.text,
    required this.keyboardType,
    required this.controller,
    this.isVisible,
    this.leadingSuffixText,
    this.trailingSuffixText,
    this.leadingTextClicked,
    this.trailingTextClicked,
    this.leadingTextColor,
    this.trailingTextColor,
    this.leadingColor,
    this.trailingColor,
  }) : super(key: key);

  final String text;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool? isVisible;
  final String? leadingSuffixText;
  final String? trailingSuffixText;
  final VoidCallback? leadingTextClicked;
  final VoidCallback? trailingTextClicked;
  final Color? leadingTextColor;
  final Color? trailingTextColor;
  final Color? leadingColor;
  final Color? trailingColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: SizedBox(
            width: context.mQWidth * 0.3,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Visibility(
                visible: isVisible ?? false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: leadingTextClicked ?? () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: leadingColor ?? primaryColor,
                        ),
                        width: context.mQWidth * 0.12,
                        height: context.mQWidth * 0.12,
                        child: Center(
                          child: Text(
                            leadingSuffixText ?? "",
                            style: TextStyle(
                                color: leadingTextColor ??
                                    AppColors.innactiveColor),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: trailingTextClicked ?? () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: trailingColor ?? primaryColor,
                        ),
                        width: context.mQWidth * 0.12,
                        height: context.mQWidth * 0.12,
                        child: Center(
                          child: Text(
                            trailingSuffixText ?? "",
                            style: TextStyle(
                              color:
                                  trailingTextColor ?? AppColors.innactiveColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: text,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
