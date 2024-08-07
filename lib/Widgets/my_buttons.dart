// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String buttonText;
  final VoidCallback onTap;

  const MyButtons({
    super.key,
    required this.buttonColor,
    required this.textColor,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.008),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onTap,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.022,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
