import 'package:flutter/material.dart';
import 'package:hackathon_frontend/components/action_field.dart';

class Option {
  final String label;
  final double value;

  const Option(this.label, this.value);
}

class OptionField extends StatelessWidget {
  final String label;
  final double? value;
  final List<Option> options;
  final Function(double) onChanged;

  const OptionField({
    super.key,
    this.label = "Action Name",
    this.options = const [],
    this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ActionField(
      label: label,
      valueWidget: ToggleButtons(
        isSelected: options.map((option) => option.value == value).toList(),
        onPressed: (index) => onChanged(options[index].value),
        children: options
            .map(
              (option) => Container(
                padding: const EdgeInsets.all(12.0),
                constraints: const BoxConstraints(minWidth: 70.0),
                child: Text(
                  option.label,
                  style: const TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
