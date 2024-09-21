import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hackathon_frontend/models/health_entry.dart';
import 'package:hackathon_frontend/screens/results_screen.dart';
import 'package:hackathon_frontend/screens/welcome_screen.dart';
import 'package:hackathon_frontend/services/api_service.dart';
import 'package:hackathon_frontend/screens/rating_screen.dart';
import 'package:hackathon_frontend/services/db_helper.dart';
import 'package:hackathon_frontend/screens/train_screen.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    title: 'AB App',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        errorColor: Colors.red,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
    ),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showWelcome = true;
  bool loading = false;
  bool hasResults = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (showWelcome) {
      return WelcomeScreen(
        onGetStartedPressed: () {
          setState(() {
            showWelcome = false;
          });
        },
      );
    }

    if (hasResults) {
      return ResultsScreen(
        onDonePressed: () {
          setState(() {
            showWelcome = true;
          });
        },
      );
    }

    return TrainScreen(
      onEntrySubmitted: (entry) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RatingScreen(
              loading: loading,
              originalEntry: entry,
              onRatingSubmitted: (entry) async {
                setState(() {
                  loading = true;
                });
                await DBHelper.insertHealthEntry(entry);
                List<HealthEntry> entries = await DBHelper.getHealthEntries();
                await ApiService.submitHealthEntrys(entries);
                if (context.mounted) {
                  setState(() {
                    loading = false;
                    hasResults = true;
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
