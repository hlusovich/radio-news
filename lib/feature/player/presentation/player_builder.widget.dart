import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_news/feature/player/domain/bloc/player.bloc.dart';
import 'package:radio_news/feature/player/presentation/player.widget.dart';

class PlayerBuilder extends StatelessWidget {
  const PlayerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: PlayerBloc()),
      ],
      child: const PlayerWidget(),
    );
  }
}
