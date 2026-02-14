import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../shared/widgets/responsive_layout.dart';
import '../../../setup/domain/models/breathing_settings.dart';

enum BreathingPhase { getReady, breatheIn, holdIn, breatheOut, holdOut }

class BreathingExerciseScreen extends StatefulWidget {
  final BreathingSettings settings;

  const BreathingExerciseScreen({super.key, required this.settings});

  @override
  State<BreathingExerciseScreen> createState() =>
      _BreathingExerciseScreenState();
}

class _BreathingExerciseScreenState extends State<BreathingExerciseScreen>
    with SingleTickerProviderStateMixin {
  BreathingPhase currentPhase = BreathingPhase.getReady;
  int countdown = 3;
  int currentCycle = 1;
  bool isPaused = false;
  Timer? _timer;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
    _startGetReadyPhase();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scaleController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _startGetReadyPhase() {
    setState(() {
      currentPhase = BreathingPhase.getReady;
      countdown = 3;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isPaused) return;

      setState(() {
        countdown--;
      });

      if (countdown == 0) {
        timer.cancel();
        _startBreathingCycle();
      }
    });
  }

  void _startBreathingCycle() {
    _startBreatheInPhase();
  }

  void _startBreatheInPhase() {
    setState(() {
      currentPhase = BreathingPhase.breatheIn;
      countdown = widget.settings.inhaleDuration;
    });

    // Animate circle shrinking
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
    _scaleController.duration = Duration(
      seconds: widget.settings.inhaleDuration,
    );
    _scaleController.forward(from: 0);

    _playChime();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isPaused) return;

      setState(() {
        countdown--;
      });

      if (countdown == 0) {
        timer.cancel();
        _startHoldInPhase();
      }
    });
  }

  void _startHoldInPhase() {
    setState(() {
      currentPhase = BreathingPhase.holdIn;
      countdown = widget.settings.holdDuration;
    });

    _playChime();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isPaused) return;

      setState(() {
        countdown--;
      });

      if (countdown == 0) {
        timer.cancel();
        _startBreatheOutPhase();
      }
    });
  }

  void _startBreatheOutPhase() {
    setState(() {
      currentPhase = BreathingPhase.breatheOut;
      countdown = widget.settings.exhaleDuration;
    });

    // Animate circle expanding
    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
    _scaleController.duration = Duration(
      seconds: widget.settings.exhaleDuration,
    );
    _scaleController.forward(from: 0);

    _playChime();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isPaused) return;

      setState(() {
        countdown--;
      });

      if (countdown == 0) {
        timer.cancel();
        _startHoldOutPhase();
      }
    });
  }

  void _startHoldOutPhase() {
    setState(() {
      currentPhase = BreathingPhase.holdOut;
      countdown = widget.settings.restDuration;
    });

    _playChime();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isPaused) return;

      setState(() {
        countdown--;
      });

      if (countdown == 0) {
        timer.cancel();
        _completeCycle();
      }
    });
  }

  void _completeCycle() {
    if (currentCycle >= widget.settings.cycles) {
      // Navigate to completion screen with settings
      Navigator.pushReplacementNamed(
        context,
        '/breathing-complete',
        arguments: widget.settings,
      );
    } else {
      setState(() {
        currentCycle++;
      });
      _startBreathingCycle();
    }
  }

  void _playChime() {
    if (widget.settings.isSoundEnabled &&
        currentPhase != BreathingPhase.getReady) {
      _audioPlayer.play(AssetSource('audio/chime.mp3'));
    }
  }

  void _togglePause() {
    setState(() {
      isPaused = !isPaused;
    });
  }

  String _getPhaseLabel() {
    switch (currentPhase) {
      case BreathingPhase.getReady:
        return 'Get ready';
      case BreathingPhase.breatheIn:
        return 'Breathe in';
      case BreathingPhase.holdIn:
        return 'Hold gently';
      case BreathingPhase.breatheOut:
        return 'Breathe out';
      case BreathingPhase.holdOut:
        return 'Hold softly';
    }
  }

  String _getPhaseSubtitle() {
    switch (currentPhase) {
      case BreathingPhase.getReady:
        return 'Get going on your breathing session';
      case BreathingPhase.breatheIn:
      case BreathingPhase.breatheOut:
        return 'nice and slow';
      case BreathingPhase.holdIn:
      case BreathingPhase.holdOut:
        return 'just be here';
    }
  }

  String _getCycleText() {
    String phaseName = '';
    switch (currentPhase) {
      case BreathingPhase.breatheIn:
        phaseName = 'Breathe in';
        break;
      case BreathingPhase.holdIn:
        phaseName = 'Hold in';
        break;
      case BreathingPhase.breatheOut:
        phaseName = 'Breathe out';
        break;
      case BreathingPhase.holdOut:
        phaseName = 'Hold out';
        break;
      default:
        return '';
    }
    return 'Cycle $currentCycle of ${widget.settings.cycles}';
  }

  double _getProgress() {
    if (currentPhase == BreathingPhase.getReady) return 0;

    int totalDuration =
        widget.settings.inhaleDuration +
        widget.settings.holdDuration +
        widget.settings.exhaleDuration +
        widget.settings.restDuration;

    int completedCycles = currentCycle - 1;
    int currentCycleDuration = 0;

    switch (currentPhase) {
      case BreathingPhase.breatheIn:
        currentCycleDuration = widget.settings.inhaleDuration - countdown;
        break;
      case BreathingPhase.holdIn:
        currentCycleDuration =
            widget.settings.inhaleDuration +
            (widget.settings.holdDuration - countdown);
        break;
      case BreathingPhase.breatheOut:
        currentCycleDuration =
            widget.settings.inhaleDuration +
            widget.settings.holdDuration +
            (widget.settings.exhaleDuration - countdown);
        break;
      case BreathingPhase.holdOut:
        currentCycleDuration =
            widget.settings.inhaleDuration +
            widget.settings.holdDuration +
            widget.settings.exhaleDuration +
            (widget.settings.restDuration - countdown);
        break;
      default:
        break;
    }

    int totalCompleted =
        (completedCycles * totalDuration) + currentCycleDuration;
    int totalTime = widget.settings.cycles * totalDuration;

    return totalCompleted / totalTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        showCloseButton: true,
        onClose: () => Navigator.pop(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Encouragement text (only during breathing session)
              if (currentPhase != BreathingPhase.getReady) ...[
                Text(
                  "You're a natural",
                  style: AppTextStyles.encouragementText(context),
                ),
                const SizedBox(height: 60),
              ],

              // Breathing Circle
              AnimatedBuilder(
                animation: _scaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      width: 196,
                      height: 196,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(98),
                        border: Border.all(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.darkCircleBorder
                              : AppColors.circleBorder,
                          width: 1,
                        ),
                        gradient: RadialGradient(
                          center: const Alignment(-0.2, -0.3),
                          radius: 0.8846,
                          colors:
                              Theme.of(context).brightness == Brightness.dark
                              ? [
                                  AppColors.darkCircleGradientStart,
                                  AppColors.darkCircleGradientEnd,
                                ]
                              : [
                                  AppColors.circleGradientStart,
                                  AppColors.circleGradientEnd,
                                ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          countdown.toString(),
                          style: AppTextStyles.countdownText(context),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 56),

              // Phase Label
              Text(
                _getPhaseLabel(),
                style: AppTextStyles.phaseMainLabel(context),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 6),

              // Phase Subtitle
              Text(
                _getPhaseSubtitle(),
                style: AppTextStyles.phaseSubtitle(context),
                textAlign: TextAlign.center,
              ),

              // Progress and controls (only during breathing session)
              if (currentPhase != BreathingPhase.getReady) ...[
                const SizedBox(height: 36),

                // Progress Indicator
                SizedBox(
                  width: 240,
                  height: 8,
                  child: LinearProgressIndicator(
                    value: _getProgress(),
                    backgroundColor: AppColors.progressUnfilled,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkSwitchThumbColor
                          : AppColors.switchThumbColor,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),

                const SizedBox(height: 8),

                // Cycle Info
                Text(
                  _getCycleText(),
                  style: AppTextStyles.cycleInfo(context),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                // Pause/Resume Button
                SizedBox(
                  width: 152,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _togglePause,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pauseButtonBg,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          isPaused
                              ? 'assets/images/light/resume.svg'
                              : 'assets/images/light/pause.svg',
                          width: 18,
                          height: 18,
                        ),
                        const SizedBox(width: 13),
                        Text(
                          isPaused ? 'Resume' : 'Pause',
                          style: AppTextStyles.pauseButtonText(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
