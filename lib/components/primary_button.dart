import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? backgroundColor;
  final Function()? onPressed;

  const PrimaryButton({
    super.key,
    this.text = "Button",
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: color ?? Theme.of(context).colorScheme.onPrimary,
        backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28.0)),
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
