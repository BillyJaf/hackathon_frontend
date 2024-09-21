import 'package:flutter/material.dart';

class ActionField extends StatelessWidget {
  final String label;
  final Widget? child;
  final Widget valueWidget;

  const ActionField({
    super.key,
    this.label = "Action Name",
    this.child,
    required this.valueWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                valueWidget,
                if (child != null) child!,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
