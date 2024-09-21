class HealthEntry {
  final int?
      id; // Optional, in case you're storing this in a database with an auto-generated ID
  final double cream1;
  final double cream2;
  final double tokHotShower;
  final double relativeHumidity;
  final double stress;
  final double facewash1;
  final double facewash2;
  final double makeup;
  final double soap;
  final double hoursInside;

  final double skinFeelRating;

  HealthEntry({
    this.id,
    required this.cream1,
    required this.cream2,
    required this.tokHotShower,
    required this.relativeHumidity,
    required this.stress,
    required this.facewash1,
    required this.facewash2,
    required this.makeup,
    required this.soap,
    required this.hoursInside,
    required this.skinFeelRating,
  });

  // Convert a HealthEntry object into a Map to store in the database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cream1': cream1,
      'cream2': cream2,
      'tokHotShower': tokHotShower,
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

  // Create a HealthEntry object from a Map (retrieved from the database)
  factory HealthEntry.fromMap(Map<String, dynamic> map) {
    return HealthEntry(
      id: map['id'],
      cream1: map['cream1'],
      cream2: map['cream2'],
      tokHotShower: map['tokHotShower'],
      relativeHumidity: map['relativeHumidity'],
      stress: map['stress'],
      facewash1: map['facewash1'],
      facewash2: map['facewash2'],
      makeup: map['makeup'],
      soap: map['soap'],
      hoursInside: map['hoursInside'],
      skinFeelRating: map['skinFeelRating'],
    );
  }

  @override
  String toString() {
    return 'HealthEntry{id: $id, cream1: $cream1, cream2: $cream2, tokHotShower: $tokHotShower, relativeHumidity: $relativeHumidity, stress: $stress, facewash1: $facewash1, facewash2: $facewash2, makeup: $makeup, soap: $soap, hoursInside: $hoursInside, skinFeelRating: $skinFeelRating}';
  }
}
