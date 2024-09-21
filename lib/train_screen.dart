import 'package:flutter/material.dart';
import 'package:hackathon_frontend/models/health_entry.dart';
import 'package:hackathon_frontend/option_field.dart';
import 'package:hackathon_frontend/slider_field.dart';

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
    hoursInside: 1.0,
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
              const Text("Train", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
              const Text("Your actions today:", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),

              // Action Fields
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      OptionField(
                        label: "Cream 1",
                        options: const [Option("Yes", 1.0), Option("No", 0.0)],
                        value: entry.cream1,
                        onChanged: (value) => setState(() => entry = entry.copyWith(cream1: value)),
                      ),
                      OptionField(
                        label: "Cream 2",
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
                      SliderField(
                        label: "Humidity",
                        suffix: "%",
                        value: entry.relativeHumidity,
                        onChanged: (value) => setState(() => entry = entry.copyWith(relativeHumidity: value)),
                      ),
                      OptionField(
                        label: "Stress",
                        options: const [Option("High", 1.0), Option("Low", 0.0)],
                        value: entry.stress,
                        onChanged: (value) => setState(() => entry = entry.copyWith(stress: value)),
                      ),
                      OptionField(
                        label: "Facewash 1",
                        options: const [Option("Yes", 1.0), Option("No", 0.0)],
                        value: entry.facewash1,
                        onChanged: (value) => setState(() => entry = entry.copyWith(facewash1: value)),
                      ),
                      OptionField(
                        label: "Facewash 2",
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
                        label: "Soap",
                        options: const [Option("Yes", 1.0), Option("No", 0.0)],
                        value: entry.soap,
                        onChanged: (value) => setState(() => entry = entry.copyWith(soap: value)),
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
              ElevatedButton(
                onPressed: () {
                  widget.onEntrySubmitted(entry.copyWith(
                    relativeHumidity: entry.relativeHumidity / 100.0, // Convert to 0.0 - 1.0 scale
                    dateTime: DateTime.now(), // Set the current time
                  ));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Text(
                    "Submit Actions",
                    style: TextStyle(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
