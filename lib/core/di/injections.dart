import 'package:get_it/get_it.dart';
import 'package:radio_news/core/api_client/api_client.service.dart';
import 'package:radio_news/core/api_client/i_api_client.service.dart';


abstract final class Injections {
  static void init() {
    GetIt.I.registerLazySingleton<IApiClientService>(() => ApiClientService());
  }
}