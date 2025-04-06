import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? contentColor;
  const AdaptiveButton({
    super.key,
    required this.icon,
    required this.label,
    this.buttonColor,
    this.contentColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonColor ?? Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon,
            color: contentColor ?? Theme.of(context).colorScheme.onPrimary,
          ),
          MediaQuery.of(context).size.width > 600
              ? Text(
                label,
                style: TextStyle(
                  color:
                      contentColor ?? Theme.of(context).colorScheme.onPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
              : Container(),
        ],
      ),
    );
  }
}
