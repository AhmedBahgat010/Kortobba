import 'package:flutter/material.dart';

class MyCustomHaveAccount extends StatelessWidget {
  final String noAccountText;
  final String registerText;
  final VoidCallback onTap;

  const MyCustomHaveAccount({
    Key? key,
    required this.noAccountText,
    required this.registerText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            noAccountText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              registerText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.orange, // Replace with your color
                color: Colors.orange, // Replace with your color
              ),
            ),
          ),
        ],
      ),
    );
  }
}