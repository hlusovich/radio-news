import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_news/core/constants/offset.constants.dart';
import 'package:radio_news/core/theme/app_colors.dart';
import 'package:radio_news/feature/player/presentation/components/player_actions.widget.dart';
import 'package:radio_news/feature/player/presentation/components/player_sound.widget.dart';
import 'package:rive/rive.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({super.key});

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  final RiveAnimationController _waveAnimationController = SimpleAnimation('Animation 1', autoplay: true);


  void _toggleAnimationController(bool state) {
    _waveAnimationController.isActive = !state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: OffsetConstants.l,
          ),
          Flexible(
            flex: 6,
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/music_album.png',
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: PlayerActions(
              onPlayToggle: _toggleAnimationController,
            ),
          ),
          Flexible(
            flex: 2,
            child: PlayerSound(
              controller: _waveAnimationController,
            ),
          ),
          const SizedBox(
            height: OffsetConstants.l,
          )
        ],
      ),
    );
  }
}
