import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'features/setup/presentation/pages/setup_screen.dart';
import 'features/setup/domain/models/breathing_settings.dart';
import 'features/breathing/presentation/pages/breathing_exercise_screen.dart';
import 'features/breathing/presentation/pages/breathing_complete_screen.dart';

class BreathingApp extends StatelessWidget {
  const BreathingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'NewU Breathe',
            debugShowCheckedModeBanner: false,

            // Theme Configuration
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,

            // Home Screen
            home: const SetupScreen(),

            // Routes
            routes: {
              '/breathing-exercise': (context) {
                final settings =
                    ModalRoute.of(context)!.settings.arguments
                        as BreathingSettings;
                return BreathingExerciseScreen(settings: settings);
              },
              '/breathing-complete': (context) =>
                  const BreathingCompleteScreen(),
            },
          );
        },
      ),
    );
  }
}
