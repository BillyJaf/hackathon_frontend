import 'package:flutter/material.dart';
import 'package:hackathon_frontend/models/health_entry.dart';
import 'package:hackathon_frontend/components/option_field.dart';
import 'package:hackathon_frontend/components/primary_button.dart';
import 'package:hackathon_frontend/components/slider_field.dart';

class TrainScreen extends StatefulWidget {
  final Function(HealthEntry) onEntrySubmitted;

  const TrainScreen({
    super.key,
    required this.onEntrySubmitted,
  });

  @override
  State<TrainScreen> createState() => _TrainScreenState();
}

class _TrainScreenState extends State<TrainScreen> {
  HealthEntry entry = HealthEntry(
    cream1: 1.0,
    cream2: 1.0,
    tookHotShower: 1.0,
    relativeHumidity: 0.0,
    stress: 1.0,
    facewash1: 1.0,
    facewash2: 1.0,
    makeup: 1.0,
    soap: 1.0,
    hoursInside: 0.0,
    dateTime: DateTime.now(),
    skinFeelRating: 0.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Header Text
              const Text("Track", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
              const Text(
                "What actions did you take today?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),

              // Action Fields
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      OptionField(
                        label: "CeraVe Moisturizing Cream",
                        options: const [Option("Yes", 1.0), Option("No", 0.0)],
                        value: entry.cream1,
                        onChanged: (value) => setState(() => entry = entry.copyWith(cream1: value)),
                      ),
                      OptionField(
                        label: "Ego QV Cream",
                        options: const [Option("Yes", 1.0), Option("No", 0.0)],
                        value: entry.cream2,
                        onChanged: (value) => setState(() => entry = entry.copyWith(cream2: value)),
                      ),
                      OptionField(
                        label: "Shower Temperature",
                        options: const [Option("Hot", 1.0), Option("Cold", 0.0)],
                        value: entry.tookHotShower,
                        onChanged: (value) => setState(() => entry = entry.copyWith(tookHotShower: value)),
                      ),
                      OptionField(
                        label: "Body Wash",
                        options: const [Option("Yes", 1.0), Option("No", 0.0)],
                        value: entry.soap,
                        onChanged: (value) => setState(() => entry = entry.copyWith(soap: value)),
                      ),
                      OptionField(
                        label: "Neutrogena Clear & Defend",
                        options: const [Option("Yes", 1.0), Option("No", 0.0)],
                        value: entry.facewash1,
                        onChanged: (value) => setState(() => entry = entry.copyWith(facewash1: value)),
                      ),
                      OptionField(
                        label: "Nivea Gentle Cleansing Cream",
                        options: const [Option("Yes", 1.0), Option("No", 0.0)],
                        value: entry.facewash2,
                        onChanged: (value) => setState(() => entry = entry.copyWith(facewash2: value)),
                      ),
                      OptionField(
                        label: "Makeup",
                        options: const [Option("Yes", 1.0), Option("No", 0.0)],
                        value: entry.makeup,
                        onChanged: (value) => setState(() => entry = entry.copyWith(makeup: value)),
                      ),
                      OptionField(
                        label: "Stress",
                        options: const [Option("High", 1.0), Option("Low", 0.0)],
                        value: entry.stress,
                        onChanged: (value) => setState(() => entry = entry.copyWith(stress: value)),
                      ),
                      SliderField(
                        label: "Air Humidity",
                        suffix: "%",
                        value: entry.relativeHumidity,
                        onChanged: (value) => setState(() => entry = entry.copyWith(relativeHumidity: value)),
                      ),
                      SliderField(
                        label: "Hours Inside",
                        suffix: "hrs",
                        min: 0.0,
                        max: 24.0,
                        value: entry.hoursInside,
                        onChanged: (value) => setState(() => entry = entry.copyWith(hoursInside: value)),
                      )
                    ],
                  ),
                ),
              ),

              // Submit Button
              PrimaryButton(
                text: "Next",
                onPressed: () {
                  widget.onEntrySubmitted(entry.copyWith(
                    relativeHumidity: entry.relativeHumidity / 100.0, // Convert to 0.0 - 1.0 scale
                    hoursInside: entry.hoursInside / 24.0, // Convert to 0.0 - 1.0 scale
                    dateTime: DateTime.now(), // Set the current time
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
