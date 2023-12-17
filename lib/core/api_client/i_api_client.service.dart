import 'package:chopper/chopper.dart';
import 'package:radio_news/core/data/constants/api.constants.dart';
import 'package:radio_news/core/data/repositories/news_repository.dart';

abstract interface class IApiClientService {
  T getService<T extends ChopperService>();
}

