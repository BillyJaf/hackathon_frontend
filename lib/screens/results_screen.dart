import 'package:flutter/material.dart';
import 'package:hackathon_frontend/components/field_result.dart';
import 'package:hackathon_frontend/components/primary_button.dart';
import 'package:hackathon_frontend/models/health_entry.dart';

class ResultsScreen extends StatelessWidget {
  final double recordedRating;
  final HealthEntry results;
  final Function() onDonePressed;

  const ResultsScreen({
    super.key,
    required this.recordedRating,
    required this.results,
    required this.onDonePressed,
  });

  @override
  Widget build(BuildContext context) {
    String modelPrediction = (results.skinFeelRating * 10).toStringAsFixed(0);
    String actualRating = (recordedRating * 10).toStringAsFixed(0);
    String difference = ((results.skinFeelRating - recordedRating).abs() * 10).toStringAsFixed(0);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Results", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                    Text(
                      "We've analyzed your data and found the best routine for your skin.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Text(
                  "We think you should aim for:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FieldResult(label: "CeraVe Moisturizing Cream", recommended: results.cream1 > 0.5),
                    FieldResult(label: "Ego QV Cream", recommended: results.cream2 > 0.5),
                    FieldResult(label: "Hot Showers", recommended: results.tookHotShower > 0.5),
                    FieldResult(label: "Body Wash", recommended: results.soap > 0.5),
                    FieldResult(label: "Neutrogena Clear & Defend", recommended: results.facewash1 > 0.5),
                    FieldResult(label: "Nivea Gentle Cleansing Cream", recommended: results.facewash2 > 0.5),
                    FieldResult(label: "Makeup", recommended: results.makeup > 0.5),
                    FieldResult(label: "High Stress", recommended: results.stress > 0.5),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Text(
                      "The model predicted a score of $modelPrediction",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "However, your actual rating today was $actualRating ($difference points difference).",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              PrimaryButton(
                text: "Done",
                onPressed: onDonePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
