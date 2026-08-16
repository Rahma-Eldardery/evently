import 'package:flutter/material.dart';

class AuthRedirectText extends StatelessWidget {
  final String message;
  final String actionText;
  final VoidCallback onTap;

  const AuthRedirectText({
    super.key,
    required this.message,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message, style: Theme.of(context).textTheme.titleMedium),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
