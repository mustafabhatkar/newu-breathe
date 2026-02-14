class BreathingSettings {
  final int inhaleDuration; // in seconds
  final int holdDuration; // in seconds
  final int exhaleDuration; // in seconds
  final int restDuration; // in seconds
  final int cycles; // number of breathing cycles
  final bool isSoundEnabled; // whether to play chime sounds

  const BreathingSettings({
    required this.inhaleDuration,
    required this.holdDuration,
    required this.exhaleDuration,
    required this.restDuration,
    required this.cycles,
    this.isSoundEnabled = true,
  });

  // Default settings
  factory BreathingSettings.defaultSettings() {
    return const BreathingSettings(
      inhaleDuration: 4,
      holdDuration: 4,
      exhaleDuration: 4,
      restDuration: 4,
      cycles: 5,
    );
  }

  // Copy with method
  BreathingSettings copyWith({
    int? inhaleDuration,
    int? holdDuration,
    int? exhaleDuration,
    int? restDuration,
    int? cycles,
    bool? isSoundEnabled,
  }) {
    return BreathingSettings(
      inhaleDuration: inhaleDuration ?? this.inhaleDuration,
      holdDuration: holdDuration ?? this.holdDuration,
      exhaleDuration: exhaleDuration ?? this.exhaleDuration,
      restDuration: restDuration ?? this.restDuration,
      cycles: cycles ?? this.cycles,
      isSoundEnabled: isSoundEnabled ?? this.isSoundEnabled,
    );
  }

  // Total duration for one cycle
  int get cycleDuration =>
      inhaleDuration + holdDuration + exhaleDuration + restDuration;

  // Total duration for all cycles
  int get totalDuration => cycleDuration * cycles;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BreathingSettings &&
        other.inhaleDuration == inhaleDuration &&
        other.holdDuration == holdDuration &&
        other.exhaleDuration == exhaleDuration &&
        other.restDuration == restDuration &&
        other.cycles == cycles &&
        other.isSoundEnabled == isSoundEnabled;
  }

  @override
  int get hashCode {
    return inhaleDuration.hashCode ^
        holdDuration.hashCode ^
        exhaleDuration.hashCode ^
        restDuration.hashCode ^
        cycles.hashCode ^
        isSoundEnabled.hashCode;
  }

  @override
  String toString() {
    return 'BreathingSettings(inhaleDuration: $inhaleDuration, holdDuration: $holdDuration, exhaleDuration: $exhaleDuration, restDuration: $restDuration, cycles: $cycles, isSoundEnabled: $isSoundEnabled)';
  }
}
