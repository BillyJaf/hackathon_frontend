class HealthEntry {
  final int? id; // Optional, in case you're storing this in a database with an auto-generated ID
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
    this.id,
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
    int? id,
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
      id: id ?? this.id,
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
      'id': id,
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

  // Create a HealthEntry object from a Map (retrieved from the database)
  factory HealthEntry.fromMap(Map<String, dynamic> map) {
    return HealthEntry(
      id: map['id'],
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
    return 'HealthEntry{id: $id, cream1: $cream1, cream2: $cream2, tookHotShower: $tookHotShower, relativeHumidity: $relativeHumidity, stress: $stress, facewash1: $facewash1, facewash2: $facewash2, makeup: $makeup, soap: $soap, hoursInside: $hoursInside, dateTime: $dateTime, skinFeelRating: $skinFeelRating}';
  }
}
