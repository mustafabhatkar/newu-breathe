import '../../domain/models/breathing_settings.dart';

abstract class SetupEvent {
  const SetupEvent();
}

class UpdateInhaleDuration extends SetupEvent {
  final int duration;
  const UpdateInhaleDuration(this.duration);
}

class UpdateHoldDuration extends SetupEvent {
  final int duration;
  const UpdateHoldDuration(this.duration);
}

class UpdateExhaleDuration extends SetupEvent {
  final int duration;
  const UpdateExhaleDuration(this.duration);
}

class UpdateRestDuration extends SetupEvent {
  final int duration;
  const UpdateRestDuration(this.duration);
}

class UpdateCycles extends SetupEvent {
  final int cycles;
  const UpdateCycles(this.cycles);
}

class ResetToDefaults extends SetupEvent {
  const ResetToDefaults();
}

class StartExercise extends SetupEvent {
  const StartExercise();
}
