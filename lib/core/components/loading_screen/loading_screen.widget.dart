import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_news/core/theme/app_colors.dart';
import 'package:rive/rive.dart';

class LoadingScreenWidget extends StatelessWidget {
  const LoadingScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            AppColors.main,
            BlendMode.modulate,
          ),
          child: Transform.scale(scale: 2, child: const RiveAnimation.asset('assets/rive/loading.riv')),
        ),
      ),
    );
  }
}
