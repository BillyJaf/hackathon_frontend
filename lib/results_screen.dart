import 'package:flutter/material.dart';
import 'package:hackathon_frontend/primary_button.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: "Done",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
