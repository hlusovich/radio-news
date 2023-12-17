import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radio_news/core/clippers/wave.clipper.dart';
import 'package:radio_news/core/components/loading_screen/loading_screen.widget.dart';
import 'package:radio_news/core/constants/offset.constants.dart';
import 'package:radio_news/core/theme/app_colors.dart';
import 'package:radio_news/feature/player/domain/bloc/player.state.dart';
import 'package:radio_news/feature/player/domain/bloc/player.bloc.dart';
import 'package:radio_news/feature/player/domain/bloc/player.events.dart';
import 'package:radio_news/feature/player/presentation/components/player_actions.widget.dart';
import 'package:radio_news/feature/player/presentation/components/player_sound.widget.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PlayerBloc>();
    return Scaffold(
      backgroundColor:  AppColors.darkBlue,
      body: BlocBuilder<PlayerBloc, PlayerBlocStates>(builder: (context, state) {
        if (state is PlayerBlocLoadingState) {
          return const LoadingScreenWidget();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: OffsetConstants.l,
            ),
            Flexible(
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/music_album.png',
                    ),
                  ),
                  Text(
                    'Radio player',
                    style: GoogleFonts.pacifico(
                        textStyle: TextStyle(fontSize: 40, color: AppColors.main, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ColoredBox(
                color: AppColors.main,
                child: Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: ClipPath(
                        clipper: WaveClipper(),
                        child: Container(
                          color:  AppColors.darkBlue,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Column(
                        children: [
                          Flexible(
                            child: PlayerActions(
                              onPlayToggle: (_) {
                                bloc.add(
                                  PlayerClickPlayButton(),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: OffsetConstants.m,
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: OffsetConstants.l * 3,
                                ),
                                Flexible(
                                  child: PlayerSound(
                                    controller: bloc.waveAnimationController,
                                  ),
                                ),
                                const SizedBox(
                                  width: OffsetConstants.l * 3,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: OffsetConstants.m,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
