import 'dart:async';
import 'package:hackathon_frontend/models/health_entry.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> openDatabaseConnection() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'health_entries.db');

    return await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      path,
      // When the database is first created, create a table to store the health entries
      onCreate: (db, version) async {
        // Create tables here
        await db.execute(
          'CREATE TABLE health_entries('
          'cream1 REAL, '
          'cream2 REAL, '
          'tookHotShower REAL, '
          'relativeHumidity REAL, '
          'stress REAL, '
          'facewash1 REAL, '
          'facewash2 REAL, '
          'makeup REAL, '
          'soap REAL, '
          'hoursInside REAL, '
          'dateTime TEXT, '
          'skinFeelRating REAL)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertHealthEntry(HealthEntry healthEntry) async {
    final db = await openDatabaseConnection();

    await db.insert(
      'health_entries',
      healthEntry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> insertHealthEntries(
      List<HealthEntry> healthEntries) async {
    final db = await openDatabaseConnection();

    final batch = db.batch();

    for (final healthEntry in healthEntries) {
      batch.insert(
        'health_entries',
        healthEntry.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  static Future<List<HealthEntry>> getHealthEntries() async {
    final db = await openDatabaseConnection();

    final List<Map<String, dynamic>> healthEntryMaps =
        await db.query('health_entries');

    // Convert the list of each health entry fields into a list of `HealEntry` objects.
    return [
      for (final healthEntryMap in healthEntryMaps)
        HealthEntry.fromMap(healthEntryMap),
    ];
  }

  // Method to check if the database is empty
  static Future<bool> isTableEmpty() async {
    final db = await openDatabaseConnection();
    var result = await db.rawQuery('SELECT COUNT(*) FROM health_entries');
    int? count = Sqflite.firstIntValue(result); // Retrieve the count

    return count == 0;
  }
}
