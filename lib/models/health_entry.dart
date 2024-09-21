import 'dart:convert';
import 'package:flutter/services.dart';

class HealthEntry {
  final double cream1;
  final double cream2;
  final double tookHotShower;
  final double relativeHumidity;
  final double stress;
  final double facewash1;
  final double facewash2;
  final double makeup;
  final double soap;
  final double hoursInside;
  final DateTime dateTime;

  final double skinFeelRating;

  HealthEntry({
    required this.cream1,
    required this.cream2,
    required this.tookHotShower,
    required this.relativeHumidity,
    required this.stress,
    required this.facewash1,
    required this.facewash2,
    required this.makeup,
    required this.soap,
    required this.hoursInside,
    required this.dateTime,
    required this.skinFeelRating,
  });

  // To new HealthEntry object with updated values
  HealthEntry copyWith({
    double? cream1,
    double? cream2,
    double? tookHotShower,
    double? relativeHumidity,
    double? stress,
    double? facewash1,
    double? facewash2,
    double? makeup,
    double? soap,
    double? hoursInside,
    DateTime? dateTime,
    double? skinFeelRating,
  }) {
    return HealthEntry(
      cream1: cream1 ?? this.cream1,
      cream2: cream2 ?? this.cream2,
      tookHotShower: tookHotShower ?? this.tookHotShower,
      relativeHumidity: relativeHumidity ?? this.relativeHumidity,
      stress: stress ?? this.stress,
      facewash1: facewash1 ?? this.facewash1,
      facewash2: facewash2 ?? this.facewash2,
      makeup: makeup ?? this.makeup,
      soap: soap ?? this.soap,
      hoursInside: hoursInside ?? this.hoursInside,
      dateTime: dateTime ?? this.dateTime,
      skinFeelRating: skinFeelRating ?? this.skinFeelRating,
    );
  }

  // Convert a HealthEntry object into a Map to store in the database
  Map<String, dynamic> toMap() {
    return {
      'cream1': cream1,
      'cream2': cream2,
      'tookHotShower': tookHotShower,
      'relativeHumidity': relativeHumidity,
      'stress': stress,
      'facewash1': facewash1,
      'facewash2': facewash2,
      'makeup': makeup,
      'soap': soap,
      'hoursInside': hoursInside,
      'dateTime': dateTime.toIso8601String(),
      'skinFeelRating': skinFeelRating,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'cream1': cream1,
      'cream2': cream2,
      'tookHotShower': tookHotShower,
      'relativeHumidity': relativeHumidity,
      'stress': stress,
      'facewash1': facewash1,
      'facewash2': facewash2,
      'makeup': makeup,
      'soap': soap,
      'hoursInside': hoursInside,
      'skinFeelRating': skinFeelRating,
    };
  }

  static fromJson(Map<String, dynamic> json) {
    return HealthEntry(
      cream1: json['cream1'],
      cream2: json['cream2'],
      tookHotShower: json['tookHotShower'],
      relativeHumidity: json['relativeHumidity'],
      stress: json['stress'],
      facewash1: json['facewash1'],
      facewash2: json['facewash2'],
      makeup: json['makeup'],
      soap: json['soap'],
      hoursInside: json['hoursInside'],
      dateTime: DateTime.now(),
      skinFeelRating: json['skinFeelRating'],
    );
  }

  // Create a HealthEntry object from a Map (retrieved from the database)
  factory HealthEntry.fromMap(Map<String, dynamic> map) {
    return HealthEntry(
      cream1: map['cream1'],
      cream2: map['cream2'],
      tookHotShower: map['tookHotShower'],
      relativeHumidity: map['relativeHumidity'],
      stress: map['stress'],
      facewash1: map['facewash1'],
      facewash2: map['facewash2'],
      makeup: map['makeup'],
      soap: map['soap'],
      hoursInside: map['hoursInside'],
      dateTime: DateTime.parse(map['dateTime']),
      skinFeelRating: map['skinFeelRating'],
    );
  }

  @override
  String toString() {
    return 'HealthEntry{cream1: $cream1, cream2: $cream2, tookHotShower: $tookHotShower, relativeHumidity: $relativeHumidity, stress: $stress, facewash1: $facewash1, facewash2: $facewash2, makeup: $makeup, soap: $soap, hoursInside: $hoursInside, dateTime: $dateTime, skinFeelRating: $skinFeelRating}';
  }

  static HealthEntry createEmpty() {
    return HealthEntry(
      cream1: 0,
      cream2: 0,
      tookHotShower: 0,
      relativeHumidity: 0,
      stress: 0,
      facewash1: 0,
      facewash2: 0,
      makeup: 0,
      soap: 0,
      hoursInside: 0,
      dateTime: DateTime.now(),
      skinFeelRating: 0,
    );
  }

  static Future<List<HealthEntry>> createListFromJsonFile() async {
    final String response = await rootBundle.loadString('assets/skin_data.json');
    final jsonData = await json.decode(response);

    List<HealthEntry> healthDataList = [];
    for (var i = 0; i < jsonData.length; i++) {
      healthDataList.add(HealthEntry.fromJson(jsonData[i]));
    }
    return healthDataList;
  }
}
