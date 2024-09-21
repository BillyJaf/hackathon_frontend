import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hackathon_frontend/models/health_entry.dart';
import 'package:hackathon_frontend/services/api_service.dart';
import 'package:hackathon_frontend/rating_screen.dart';
import 'package:hackathon_frontend/services/db_helper.dart';
import 'package:hackathon_frontend/train_screen.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();

  DBHelper.openDatabaseConnection();
  if (await DBHelper.isTableEmpty()) {
    print("Created health_entries table and add 100 entries");
    DBHelper.insertHealthEntries(
        await HealthEntry.create_list_from_json_file());
  }

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
              onRatingSubmitted: (entry) async {
                await DBHelper.insertHealthEntry(entry);
                List<HealthEntry> entries = await DBHelper.getHealthEntries();
                final entriesLength = entries.length;
                print("Send $entriesLength entries to backend");
                await ApiService.submitHealthEntrys(entries);
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }
}
