import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_news/core/theme/app_colors.dart';
import 'package:radio_news/feature/player/presentation/components/painter/triangle_painter.dart';
import 'package:radio_news/feature/player/presentation/enums/rotation.enum.dart';
import 'package:rive/rive.dart';
import 'dart:math' as math;
class PlayerActionChange extends StatelessWidget {
  final VoidCallback? onChange;
  final RotationEnum direction;


  const PlayerActionChange({this.onChange, this.direction = RotationEnum.left, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ClipOval(
        child: ColoredBox(
          color: AppColors.main2,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                shape: MaterialStateProperty.all(
                  const CircleBorder(),
                ),
              ),
              onPressed: onChange,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: direction == RotationEnum.left ? null : 20,
                    child: Transform.rotate(
                      angle: direction.value *  math.pi / 2,
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CustomPaint(
                          painter: TrianglePainter(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: direction == RotationEnum.right ? null : 20,

                    child: Transform.rotate(
                      angle: direction.value * math.pi / 2,
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CustomPaint(
                          painter: TrianglePainter(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
