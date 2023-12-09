import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_news/core/theme/app_colors.dart';
import 'package:rive/rive.dart';

class PlayerActionPlay extends StatefulWidget {
  final Function(bool state)? onPlayToggle;

  const PlayerActionPlay({required this.onPlayToggle,super.key});

  @override
  State<PlayerActionPlay> createState() => _PlayerActionPlayState();
}

class _PlayerActionPlayState extends State<PlayerActionPlay> {
  late final SMIInput<bool> _playInput;
  Artboard? _playArtboard;

  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/rive/play_button.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;

      final stateMachineController = StateMachineController.fromArtboard(artboard, 'State Machine 1');

      if (stateMachineController != null) {
        artboard.addController(stateMachineController);
        _playInput = stateMachineController.findSMI('Boolean 1');
      }

      setState(() {
        _playArtboard = artboard;
      });
    });
  }
  void _togglePlayButtonAnimation() {
    setState(() {
      _playInput.value = !_playInput.value;
      widget.onPlayToggle?.call(_playInput.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final artboard = _playArtboard;
    return  SizedBox(
      height: 110,
      width: 110,
      child: ClipOval(
        child: artboard == null
            ? const SizedBox()
            : ColoredBox(
          color: AppColors.main2,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: ClipOval(
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                  shape: MaterialStateProperty.all(
                    const CircleBorder(),
                  ),
                ),
                onPressed: _togglePlayButtonAnimation,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.blue,
                      BlendMode.screen
                  ),
                  child: Rive(
                    artboard: artboard,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
