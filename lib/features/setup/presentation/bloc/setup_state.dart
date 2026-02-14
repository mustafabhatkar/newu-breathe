import 'package:equatable/equatable.dart';
import '../../domain/models/breathing_settings.dart';

abstract class SetupState extends Equatable {
  const SetupState();

  @override
  List<Object> get props => [];
}

class SetupInitial extends SetupState {
  final BreathingSettings settings;

  const SetupInitial(this.settings);

  @override
  List<Object> get props => [settings];
}

class SetupUpdated extends SetupState {
  final BreathingSettings settings;

  const SetupUpdated(this.settings);

  @override
  List<Object> get props => [settings];
}

class SetupReady extends SetupState {
  final BreathingSettings settings;

  const SetupReady(this.settings);

  @override
  List<Object> get props => [settings];
}
