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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  if (child != null) child!,
                ],
              ),
            ),
            valueWidget,
          ],
        ),
      ),
    );
  }
}
