import 'package:flutter/material.dart';
import 'package:hackathon_frontend/action_field.dart';

class SliderField extends StatelessWidget {
  final String label;
  final String suffix;
  final double value;
  final double min;
  final double max;
  final Function(double) onChanged;

  const SliderField({
    super.key,
    this.label = "Action Name",
    this.suffix = "",
    this.value = 0.0,
    this.min = 0.0,
    this.max = 100.0,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ActionField(
      label: label,
      valueWidget: SizedBox(
        width: 84.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value.toStringAsFixed(0),
              style: const TextStyle(fontSize: 36.0, fontWeight: FontWeight.w400),
              textAlign: TextAlign.right,
            ),
            const SizedBox(width: 4.0),
            Text(
              suffix,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
      child: Slider(
        min: min,
        max: max,
        value: value,
        onChanged: onChanged,
        inactiveColor: Theme.of(context).disabledColor,
      ),
    );
  }
}
