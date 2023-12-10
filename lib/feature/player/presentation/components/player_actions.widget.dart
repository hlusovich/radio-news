import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_news/core/constants/offset.constants.dart';
import 'package:radio_news/feature/player/domain/bloc/player.bloc.dart';
import 'package:radio_news/feature/player/presentation/components/buttons/player_action_play.widget.dart';
import 'package:radio_news/feature/player/presentation/enums/rotation.enum.dart';

import '../../domain/bloc/player.events.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PlayerActionChange(
                onChange: () {},
              ),
              const SizedBox(
                width: OffsetConstants.m,
              ),
              PlayerActionPlay(
                onPlayToggle: onPlayToggle,
              ),
              const SizedBox(
                width: OffsetConstants.m,
              ),
              PlayerActionChange(
                onChange: () {},
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
