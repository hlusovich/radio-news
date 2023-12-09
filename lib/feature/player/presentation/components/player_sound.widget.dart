import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_news/core/theme/app_colors.dart';
import 'package:rive/rive.dart';

class PlayerSound extends StatelessWidget {
  final RiveAnimationController controller;

  const PlayerSound({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        AppColors.white,
        BlendMode.srcIn,
      ),
      child: RiveAnimation.asset(
        'assets/rive/sound.riv',
        controllers: [
          controller,
        ],
      ),
    );
  }
}
