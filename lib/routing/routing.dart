import 'package:flutter/widgets.dart';
import 'package:radio_news/feature/initialization_screen/presentation/initialization_screen.widget.dart';
import 'package:radio_news/feature/player/presentation/player.widget.dart';
import 'package:radio_news/routing/enums/routing.enum.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  RoutingEnum.home.name: (context) => const InitializationScreenWidget(),
  RoutingEnum.player.name: (context) => const PlayerWidget(),
};