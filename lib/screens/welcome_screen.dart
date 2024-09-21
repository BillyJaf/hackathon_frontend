import 'package:flutter/material.dart';
import 'package:hackathon_frontend/components/primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  final void Function() onGetStartedPressed;
  const WelcomeScreen({
    super.key,
    required this.onGetStartedPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 64.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/meditation.png',
                  width: MediaQuery.of(context).size.width - 100,
                ),
                const SizedBox(height: 32.0),
                Text(
                  'SkinTune',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 48.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "Your health made scientific.",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "The effects of your daily actions can be unclear, so we use machine learning to find what is helping or hindering your skin's health.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const Expanded(child: SizedBox()),
                PrimaryButton(
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  text: 'Get Started',
                  onPressed: () {
                    onGetStartedPressed();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
