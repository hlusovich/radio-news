import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_news/feature/player/domain/bloc/player.state.dart';
import 'package:radio_news/feature/player/domain/bloc/player.events.dart';
import 'package:rive/rive.dart';

class PlayerBloc extends Bloc<PlayerEvents, PlayerBlocStates> {
  PlayerBloc() : super(const PlayerBlocCommonState(isActive: false)) {
    on<PlayerClickPlayButton>(onTogglePlayButton);
    on<PlayerClickChangeButton>(onClickChangeButton);
    on<PlayerChangeLoadingStatus>(onPlayerChangeLoadingStatus);
  }

  final RiveAnimationController waveAnimationController = SimpleAnimation('Animation 1', autoplay: true);

  void onTogglePlayButton(PlayerClickPlayButton event, Emitter<PlayerBlocStates> emit) async {
    final commonState = state;

    if (commonState is PlayerBlocCommonState) {
      _toggleAnimationController(!commonState.isActive);
      emit(
        commonState.copyWith(isActive: !commonState.isActive),
      );
    }
  }

  void onClickChangeButton(PlayerClickChangeButton event, Emitter<PlayerBlocStates> emit) async {}

  void onPlayerChangeLoadingStatus(PlayerChangeLoadingStatus event, Emitter<PlayerBlocStates> emit) async {
    if (event.isLoading) {
      emit(const PlayerBlocLoadingState());
      return;
    }
    emit(const PlayerBlocCommonState(isActive: true));
  }

  void _toggleAnimationController(bool state) {
    waveAnimationController.isActive = !state;
  }
}
