import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_news/core/theme/app_colors.dart';
import 'package:radio_news/feature/player/presentation/enums/rotation.enum.dart';
import 'dart:math' as math;

import 'package:radio_news/feature/player/presentation/painter/triangle_painter.dart';

class PlayerActionChange extends StatelessWidget {
  static const rotationAngle = math.pi / 2;
  final VoidCallback? onChange;
  final RotationEnum direction;

  const PlayerActionChange({this.onChange, this.direction = RotationEnum.left, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
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
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.main),
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
                left: direction == RotationEnum.left ? null : 16,
                child: Transform.rotate(
                  angle: direction.value * rotationAngle,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CustomPaint(
                      painter: TrianglePainter(
                        strokeColor: Colors.white,
                        paintingStyle: PaintingStyle.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: direction == RotationEnum.right ? null : 16,
                child: Transform.rotate(
                  angle: direction.value * rotationAngle,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CustomPaint(
                      painter: TrianglePainter(
                        strokeColor: Colors.white,
                        paintingStyle: PaintingStyle.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
