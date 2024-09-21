import 'package:flutter/material.dart';
import 'package:hackathon_frontend/action_field.dart';
import 'package:hackathon_frontend/option_field.dart';
import 'package:hackathon_frontend/slider_field.dart';

class TrainScreen extends StatelessWidget {
  const TrainScreen({super.key});

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
                    children: const [
                      OptionField(label: "Cream 1", options: [Option("Yes", 1.0), Option("No", 0.0)]),
                      OptionField(label: "Cream 2", options: [Option("Yes", 1.0), Option("No", 0.0)]),
                      OptionField(label: "Shower Temperature", options: [Option("Hot", 1.0), Option("Cold", 0.0)]),
                      SliderField(label: "Humidity", suffix: "%"),
                      OptionField(label: "Stress", options: [Option("High", 1.0), Option("Low", 0.0)]),
                      OptionField(label: "Facewash 1", options: [Option("Yes", 1.0), Option("No", 0.0)]),
                      OptionField(label: "Facewash 2", options: [Option("Yes", 1.0), Option("No", 0.0)]),
                      OptionField(label: "Makeup", options: [Option("Yes", 1.0), Option("No", 0.0)]),
                      OptionField(label: "Soap", options: [Option("Yes", 1.0), Option("No", 0.0)]),
                      SliderField(label: "Hours Inside", suffix: "hrs"),
                    ],
                  ),
                ),
              ),

              // Submit Button
              ElevatedButton(
                onPressed: () {},
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
