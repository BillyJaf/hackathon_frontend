import 'package:flutter/material.dart';
import 'package:hackathon_frontend/models/health_entry.dart';
import 'package:hackathon_frontend/components/primary_button.dart';
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
  bool loading = false;

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
                // Title Header Text
                const SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rate", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                      Text(
                        "How did your skin feel today?",
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
                loading
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width - 150,
                        height: MediaQuery.of(context).size.width - 150,
                        child: const CircularProgressIndicator(
                          strokeWidth: 24.0,
                          strokeCap: StrokeCap.round,
                        ),
                      )
                    : SleekCircularSlider(
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
                PrimaryButton(
                  text: "Submit Rating",
                  onPressed: () {
                    if (!loading) {
                      widget.onRatingSubmitted(
                        widget.originalEntry.copyWith(
                          skinFeelRating: double.parse(rating.toStringAsFixed(0)) / 10,
                        ),
                      );
                    }
                    setState(() {
                      loading = true;
                    });
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
