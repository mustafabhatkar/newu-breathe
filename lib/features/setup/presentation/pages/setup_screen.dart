import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/widgets/responsive_layout.dart';
import '../../domain/models/breathing_settings.dart';
import '../bloc/setup_bloc.dart';
import '../bloc/setup_event.dart';
import '../bloc/setup_state.dart';
import '../widgets/chip_button.dart';
import '../widgets/timing_control.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetupBloc(),
      child: const SetupView(),
    );
  }
}

class SetupView extends StatefulWidget {
  const SetupView({super.key});

  @override
  State<SetupView> createState() => _SetupViewState();
}

class _SetupViewState extends State<SetupView> {
  int selectedDuration = 4; // Default 4s
  int selectedRounds = 4; // Default 4 calm
  bool isAdvancedExpanded = false;
  int breatheInDuration = 4;
  int holdInDuration = 4;
  int breatheOutDuration = 4;
  int holdOutDuration = 4;
  bool isSoundEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        child: BlocBuilder<SetupBloc, SetupState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 0, // Space below theme switch button (52 + 48)
                left: 16,
                right: 16,
                bottom: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36.0),
                    child: Text(
                      'Set your breathing pace',
                      style: AppTextStyles.heading2xl(context),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Subtitle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36.0),
                    child: Text(
                      'Customise your breathing session. You can always change this later.',
                      style: AppTextStyles.bodySmRegular(context),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Breath Duration Section
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 27),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 33,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0x0DFFFFFF) // #FFFFFF0D for dark mode
                          : Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Theme.of(context).brightness == Brightness.dark
                          ? Border(
                              top: BorderSide(
                                color: const Color(0x0FFFFFFF), // #FFFFFF0F
                                width: 1,
                              ),
                            )
                          : null,
                      boxShadow: Theme.of(context).brightness == Brightness.dark
                          ? null
                          : [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ],
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Section Title
                            Text(
                              'Breath duration',
                              style: AppTextStyles.sectionTitle(context),
                            ),

                            const SizedBox(height: 2),

                            // Section Subtitle
                            Text(
                              'Seconds per phase',
                              style: AppTextStyles.sectionSubtitle(context),
                            ),

                            const SizedBox(height: 10),

                            // Chip Buttons Row
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ChipButton(
                                    label: '3s',
                                    isSelected: selectedDuration == 3,
                                    onTap: () {
                                      setState(() {
                                        selectedDuration = 3;
                                      });
                                      context.read<SetupBloc>().add(
                                        UpdateInhaleDuration(3),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  ChipButton(
                                    label: '4s',
                                    isSelected: selectedDuration == 4,
                                    onTap: () {
                                      setState(() {
                                        selectedDuration = 4;
                                      });
                                      context.read<SetupBloc>().add(
                                        UpdateInhaleDuration(4),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  ChipButton(
                                    label: '5s',
                                    isSelected: selectedDuration == 5,
                                    onTap: () {
                                      setState(() {
                                        selectedDuration = 5;
                                      });
                                      context.read<SetupBloc>().add(
                                        UpdateInhaleDuration(5),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  ChipButton(
                                    label: '10s',
                                    isSelected: selectedDuration == 10,
                                    onTap: () {
                                      setState(() {
                                        selectedDuration = 10;
                                      });
                                      context.read<SetupBloc>().add(
                                        UpdateInhaleDuration(10),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 28),
                        // Rounds Section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Section Title
                            Text(
                              'Rounds',
                              style: AppTextStyles.sectionTitle(context),
                            ),

                            const SizedBox(height: 2),

                            // Section Subtitle
                            Text(
                              'Full breathing cycles',
                              style: AppTextStyles.sectionSubtitle(context),
                            ),

                            const SizedBox(height: 10),

                            // Chip Buttons Row
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ChipButton(
                                    label: '2 quick',
                                    isSelected: selectedRounds == 2,
                                    width: 70,
                                    height: 50,
                                    onTap: () {
                                      setState(() {
                                        selectedRounds = 2;
                                      });
                                      context.read<SetupBloc>().add(
                                        UpdateCycles(2),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  ChipButton(
                                    label: '4 calm',
                                    isSelected: selectedRounds == 4,
                                    width: 70,
                                    height: 50,
                                    onTap: () {
                                      setState(() {
                                        selectedRounds = 4;
                                      });
                                      context.read<SetupBloc>().add(
                                        UpdateCycles(4),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  ChipButton(
                                    label: '6 deep',
                                    isSelected: selectedRounds == 6,
                                    width: 70,
                                    height: 50,
                                    onTap: () {
                                      setState(() {
                                        selectedRounds = 6;
                                      });
                                      context.read<SetupBloc>().add(
                                        UpdateCycles(6),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  ChipButton(
                                    label: '8 zen',
                                    isSelected: selectedRounds == 8,
                                    width: 70,
                                    height: 50,
                                    onTap: () {
                                      setState(() {
                                        selectedRounds = 8;
                                      });
                                      context.read<SetupBloc>().add(
                                        UpdateCycles(8),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 28),

                        // Advanced Timing Section
                        Theme(
                          data: Theme.of(
                            context,
                          ).copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            childrenPadding: EdgeInsets.zero,
                            trailing: Icon(
                              isAdvancedExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: AppColors.arrowGray,
                            ),
                            onExpansionChanged: (expanded) {
                              setState(() {
                                isAdvancedExpanded = expanded;
                                // Reset all timing values to 4s when collapsed
                                if (!expanded) {
                                  breatheInDuration = 4;
                                  holdInDuration = 4;
                                  breatheOutDuration = 4;
                                  holdOutDuration = 4;
                                }
                              });
                            },
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Advanced Timing',
                                  style: AppTextStyles.sectionTitle(context),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Set different durations for each phase',
                                  style: AppTextStyles.sectionSubtitle(context),
                                ),
                              ],
                            ),
                            children: [
                              const SizedBox(height: 10),
                              Column(
                                children: [
                                  // Breathe in control
                                  TimingControl(
                                    label: 'Breathe in',
                                    duration: breatheInDuration,
                                    onIncrement: () {
                                      if (breatheInDuration < 10) {
                                        setState(() {
                                          breatheInDuration++;
                                        });
                                      }
                                    },
                                    onDecrement: () {
                                      if (breatheInDuration > 2) {
                                        setState(() {
                                          breatheInDuration--;
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 10),

                                  // Hold in control
                                  TimingControl(
                                    label: 'Hold in',
                                    duration: holdInDuration,
                                    onIncrement: () {
                                      if (holdInDuration < 10) {
                                        setState(() {
                                          holdInDuration++;
                                        });
                                      }
                                    },
                                    onDecrement: () {
                                      if (holdInDuration > 2) {
                                        setState(() {
                                          holdInDuration--;
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 10),

                                  // Breathe out control
                                  TimingControl(
                                    label: 'Breathe out',
                                    duration: breatheOutDuration,
                                    onIncrement: () {
                                      if (breatheOutDuration < 10) {
                                        setState(() {
                                          breatheOutDuration++;
                                        });
                                      }
                                    },
                                    onDecrement: () {
                                      if (breatheOutDuration > 2) {
                                        setState(() {
                                          breatheOutDuration--;
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 10),

                                  // Hold out control
                                  TimingControl(
                                    label: 'Hold out',
                                    duration: holdOutDuration,
                                    onIncrement: () {
                                      if (holdOutDuration < 10) {
                                        setState(() {
                                          holdOutDuration++;
                                        });
                                      }
                                    },
                                    onDecrement: () {
                                      if (holdOutDuration > 2) {
                                        setState(() {
                                          holdOutDuration--;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Sound Switch
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Sound',
                            style: AppTextStyles.sectionTitle(context),
                          ),
                          subtitle: Text(
                            'Gentle chime between phases',
                            style: AppTextStyles.sectionSubtitle(context),
                          ),
                          value: isSoundEnabled,

                          thumbColor: WidgetStateColor.resolveWith((states) {
                            if (states.contains(WidgetState.selected)) {
                              return Colors.white;
                            }
                            return Theme.of(context).brightness ==
                                    Brightness.dark
                                ? AppColors.darkSwitchThumbColor
                                : AppColors.switchThumbColor;
                          }),
                          onChanged: (value) {
                            setState(() {
                              isSoundEnabled = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 26),

                  // Start Breathing Button
                  SizedBox(
                    width: 271,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Create breathing settings
                        final settings = isAdvancedExpanded
                            ? BreathingSettings(
                                // Use advanced timing values
                                inhaleDuration: breatheInDuration,
                                holdDuration: holdInDuration,
                                exhaleDuration: breatheOutDuration,
                                restDuration: holdOutDuration,
                                cycles: selectedRounds,
                                isSoundEnabled: isSoundEnabled,
                              )
                            : BreathingSettings(
                                // Use simple duration for all phases
                                inhaleDuration: selectedDuration,
                                holdDuration: selectedDuration,
                                exhaleDuration: selectedDuration,
                                restDuration: selectedDuration,
                                cycles: selectedRounds,
                                isSoundEnabled: isSoundEnabled,
                              );

                        // Navigate to breathing exercise screen
                        Navigator.pushNamed(
                          context,
                          '/breathing-exercise',
                          arguments: settings,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkSwitchThumbColor
                            : AppColors.switchThumbColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Start breathing',
                            style: AppTextStyles.startButton(context),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(
                            'assets/images/common/wind.svg',
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
