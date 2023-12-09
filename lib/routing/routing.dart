import 'package:flutter/widgets.dart';
import 'package:radio_news/core/components/initialization_screen/initialization_screen.widget.dart';
import 'package:radio_news/routing/enums/routing.enum.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  RoutingEnum.home.name: (context) => const InitializationScreenWidget(),
};