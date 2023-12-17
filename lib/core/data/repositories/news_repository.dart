
import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:radio_news/core/data/constants/api.constants.dart';

part 'news_repository.chopper.dart';

@ChopperApi(baseUrl: baseUrl)
abstract class NewsListRepository extends ChopperService {

  static NewsListRepository create([ChopperClient? client]) =>
      _$NewsListRepository(client);

  @Get()
  Future<Response> getNews();
}