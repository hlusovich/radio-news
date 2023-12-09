import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radio_news/core/constants/offset.constants.dart';
import 'package:radio_news/core/theme/app_colors.dart';
import 'package:radio_news/routing/enums/routing.enum.dart';
import 'package:rive/rive.dart';

class InitializationScreenWidget extends StatelessWidget {
  const InitializationScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: OffsetConstants.l * 2.5,
          ),
          Text(
            'Radio player',
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(fontSize: 60, color: AppColors.main, fontWeight: FontWeight.bold)),
          ),
          const Expanded(
            child: Center(
              child: RiveAnimation.asset(
                'assets/rive/initialization.riv',
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(AppColors.main),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(
                  vertical: OffsetConstants.m,
                  horizontal: OffsetConstants.l
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(RoutingEnum.playerList.name);
            },
            child: const Text(
              'Start App',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          const SizedBox(
            height: OffsetConstants.l * 2.5,
          ),
        ],
      ),
    );
  }
}
