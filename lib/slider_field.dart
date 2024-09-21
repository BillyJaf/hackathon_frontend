import 'package:flutter/material.dart';
import 'package:hackathon_frontend/action_field.dart';

class SliderField extends StatelessWidget {
  final String label;
  final String suffix;
  final double value;

  const SliderField({
    super.key,
    this.label = "Action Name",
    this.suffix = "",
    this.value = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return ActionField(
      label: label,
      valueWidget: SizedBox(
        width: 60.0,
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
        min: 0.0,
        max: 100.0,
        value: value,
        onChanged: print,
        inactiveColor: Theme.of(context).disabledColor,
      ),
    );
  }
}
