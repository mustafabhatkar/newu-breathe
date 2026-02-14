import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/breathing_settings.dart';
import 'setup_event.dart';
import 'setup_state.dart';

class SetupBloc extends Bloc<SetupEvent, SetupState> {
  SetupBloc() : super(SetupInitial(BreathingSettings.defaultSettings())) {
    on<UpdateInhaleDuration>(_onUpdateInhaleDuration);
    on<UpdateHoldDuration>(_onUpdateHoldDuration);
    on<UpdateExhaleDuration>(_onUpdateExhaleDuration);
    on<UpdateRestDuration>(_onUpdateRestDuration);
    on<UpdateCycles>(_onUpdateCycles);
    on<ResetToDefaults>(_onResetToDefaults);
    on<StartExercise>(_onStartExercise);
  }

  BreathingSettings get currentSettings {
    if (state is SetupInitial) {
      return (state as SetupInitial).settings;
    } else if (state is SetupUpdated) {
      return (state as SetupUpdated).settings;
    } else if (state is SetupReady) {
      return (state as SetupReady).settings;
    }
    return BreathingSettings.defaultSettings();
  }

  void _onUpdateInhaleDuration(
    UpdateInhaleDuration event,
    Emitter<SetupState> emit,
  ) {
    final updatedSettings = currentSettings.copyWith(
      inhaleDuration: event.duration,
    );
    emit(SetupUpdated(updatedSettings));
  }

  void _onUpdateHoldDuration(
    UpdateHoldDuration event,
    Emitter<SetupState> emit,
  ) {
    final updatedSettings = currentSettings.copyWith(
      holdDuration: event.duration,
    );
    emit(SetupUpdated(updatedSettings));
  }

  void _onUpdateExhaleDuration(
    UpdateExhaleDuration event,
    Emitter<SetupState> emit,
  ) {
    final updatedSettings = currentSettings.copyWith(
      exhaleDuration: event.duration,
    );
    emit(SetupUpdated(updatedSettings));
  }

  void _onUpdateRestDuration(
    UpdateRestDuration event,
    Emitter<SetupState> emit,
  ) {
    final updatedSettings = currentSettings.copyWith(
      restDuration: event.duration,
    );
    emit(SetupUpdated(updatedSettings));
  }

  void _onUpdateCycles(UpdateCycles event, Emitter<SetupState> emit) {
    final updatedSettings = currentSettings.copyWith(cycles: event.cycles);
    emit(SetupUpdated(updatedSettings));
  }

  void _onResetToDefaults(ResetToDefaults event, Emitter<SetupState> emit) {
    emit(SetupInitial(BreathingSettings.defaultSettings()));
  }

  void _onStartExercise(StartExercise event, Emitter<SetupState> emit) {
    emit(SetupReady(currentSettings));
  }
}
