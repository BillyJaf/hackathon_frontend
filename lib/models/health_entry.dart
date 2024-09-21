class HealthEntry {
  final int?
      id; // Optional, in case you're storing this in a database with an auto-generated ID
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

  static HealthEntry create_empty() {
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
}
