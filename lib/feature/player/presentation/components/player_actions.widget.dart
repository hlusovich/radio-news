import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_news/core/constants/offset.constants.dart';
import 'package:radio_news/core/theme/app_colors.dart';
import 'package:radio_news/feature/player/presentation/components/buttons/player_action_play.widget.dart';
import 'package:radio_news/feature/player/presentation/components/painter/triangle_painter.dart';
import 'package:radio_news/feature/player/presentation/enums/rotation.enum.dart';
import 'package:rive/rive.dart';

import 'buttons/player_action_change.widget.dart';

class PlayerActions extends StatelessWidget {
  final Function(bool state)? onPlayToggle;

  const PlayerActions({required this.onPlayToggle, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: OffsetConstants.m,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const PlayerActionChange(),
              PlayerActionPlay(
                onPlayToggle: onPlayToggle,
              ),
              const PlayerActionChange(
                direction: RotationEnum.right,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: OffsetConstants.m,
        ),
      ],
    );
  }
}
