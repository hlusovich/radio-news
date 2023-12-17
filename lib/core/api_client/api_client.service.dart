import 'package:chopper/chopper.dart';
import 'package:radio_news/core/api_client/i_api_client.service.dart';
import 'package:radio_news/core/data/constants/api.constants.dart';
import 'package:radio_news/core/data/repositories/news_repository.dart';

base class ApiClientService implements IApiClientService {
  final ChopperClient client;

  ApiClientService()
      : client = ChopperClient(
          baseUrl: Uri(path: baseUrl),
          services: [NewsListRepository.create()],
        );


  @override
  T getService<T extends ChopperService>() {
    return client.getService<T>();
  }
}
