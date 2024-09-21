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
      valueWidget: Container(
        transform: Matrix4.translationValues(0.0, 16.0, 0.0),
        child: SizedBox(
          width: 120.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        width: 140,
        child: SliderTheme(
          data: SliderThemeData(
            trackShape: CustomTrackShape(),
          ),
          child: Slider(
            min: min,
            max: max,
            value: value,
            onChanged: onChanged,
            inactiveColor: Theme.of(context).disabledColor,
          ),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 10;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
