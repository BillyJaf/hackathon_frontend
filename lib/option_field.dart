import 'package:flutter/material.dart';
import 'package:hackathon_frontend/action_field.dart';

class Option {
  final String label;
  final double value;

  const Option(this.label, this.value);
}

class OptionField extends StatelessWidget {
  final String label;
  final String? value;
  final List<Option> options;

  const OptionField({
    super.key,
    this.label = "Action Name",
    this.options = const [],
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ActionField(
      label: label,
      valueWidget: ToggleButtons(
        isSelected: options.map((option) => option.label == value).toList(),
        onPressed: (index) => print(options[index].label),
        children: options
            .map(
              (option) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  option.label,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
