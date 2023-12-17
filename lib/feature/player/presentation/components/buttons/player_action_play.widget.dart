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
      height: 120,
      width: 120,
      child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.grey,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
                // changes position of shadow
              ),
            ],
          ),
        child: ClipOval(
          child: artboard == null
              ? const SizedBox()
              : ClipOval(
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                    shape: MaterialStateProperty.all(
                      const CircleBorder(),
                    ),
                  ),
                  onPressed: _togglePlayButtonAnimation,
                  child: Transform.scale(
                    scale: 2,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          AppColors.main,
                          BlendMode.screen,
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
