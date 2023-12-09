import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class LoadingScreenWidget extends StatelessWidget {
  const LoadingScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.yellow,
            BlendMode.modulate,
          ),
          child: RiveAnimation.asset('assets/rive/loading.riv')),
    );
  }
}
