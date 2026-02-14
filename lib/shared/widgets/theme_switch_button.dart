import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theme/theme_cubit.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        context.read<ThemeCubit>().toggleTheme();
      },
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0x14FFFFFF) // #FFFFFF14
              : const Color(0x0A000000), // #0000000A
          borderRadius: BorderRadius.circular(21),
        ),
        child: Center(
          child: SvgPicture.asset(
            isDark
                ? 'assets/images/dark/light_swtch.svg'
                : 'assets/images/light/dark_switch.svg',
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
