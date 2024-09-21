import 'package:flutter/material.dart';
import 'package:hackathon_frontend/models/health_entry.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class RatingScreen extends StatefulWidget {
  final HealthEntry originalEntry;
  final Function(HealthEntry) onRatingSubmitted;

  const RatingScreen({
    super.key,
    required this.originalEntry,
    required this.onRatingSubmitted,
  });

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 0.0;

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
                    "How did your skin feel today?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SleekCircularSlider(
                    min: 0,
                    max: 10,
                    initialValue: rating,
                    appearance: CircularSliderAppearance(
                      animationEnabled: false,
                      size: MediaQuery.of(context).size.width - 100,
                      infoProperties: InfoProperties(
                        mainLabelStyle: const TextStyle(fontSize: 72, fontWeight: FontWeight.w400),
                        modifier: (double value) => value.toStringAsFixed(0),
                      ),
                      customColors: CustomSliderColors(
                        progressBarColors: [Colors.deepPurpleAccent, Colors.deepPurple],
                        trackColor: Colors.grey[300],
                        hideShadow: true,
                      ),
                    ),
                    onChangeEnd: (double value) {
                      setState(() {
                        rating = value;
                      });
                    }),
                const Expanded(child: SizedBox()),
                ElevatedButton(
                  onPressed: () {
                    widget.onRatingSubmitted(
                      widget.originalEntry.copyWith(
                        skinFeelRating: double.parse(rating.toStringAsFixed(0)),
                      ),
                    );
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
                      "Submit Rating",
                      style: TextStyle(fontSize: 22.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
