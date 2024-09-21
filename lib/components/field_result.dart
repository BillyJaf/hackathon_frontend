import 'package:flutter/material.dart';

class FieldResult extends StatelessWidget {
  final String label;
  final bool recommended;

  const FieldResult({
    super.key,
    required this.label,
    required this.recommended,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Text(label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )),
        ),
        const SizedBox(width: 8),
        Icon(
          recommended ? Icons.check : Icons.close,
          color: recommended ? Colors.green : Colors.red,
        ),
      ],
    );
  }
}
