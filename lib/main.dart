import 'package:flutter/material.dart';
import 'package:hackathon_frontend/rating_screen.dart';
import 'package:hackathon_frontend/train_screen.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return TrainScreen(
      onEntrySubmitted: (entry) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RatingScreen(
              originalEntry: entry,
              onRatingSubmitted: print, // TODO: Put API request here
            ),
          ),
        );
      },
    );
  }
}
