import 'package:flutter/material.dart';
import 'package:hackathon_frontend/components/primary_button.dart';

class ResultsScreen extends StatelessWidget {
  final Function() onDonePressed;

  const ResultsScreen({
    super.key,
    required this.onDonePressed,
  });

  @override
  Widget build(BuildContext context) {
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
              const Expanded(child: SizedBox()),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Your results are in!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
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
