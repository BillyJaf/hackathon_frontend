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

  DBHelper.openDatabaseConnection();
  if (await DBHelper.isTableEmpty()) {
    DBHelper.insertHealthEntries(await HealthEntry.createListFromJsonFile());
  }

  runApp(MaterialApp(
    title: 'SkinTune',
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

  double recordedRating = 0;
  HealthEntry? results;

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

    if (results != null) {
      return ResultsScreen(
        recordedRating: recordedRating,
        results: results!,
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
              originalEntry: entry,
              onRatingSubmitted: (entry) async {
                setState(() {
                  recordedRating = entry.skinFeelRating;
                });
                await DBHelper.insertHealthEntry(entry);
                List<HealthEntry> entries = await DBHelper.getHealthEntries();
                HealthEntry? newResults = await ApiService.submitHealthEntries(entries);
                if (context.mounted && newResults != null) {
                  setState(() {
                    results = newResults;
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
