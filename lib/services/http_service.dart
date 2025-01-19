import 'package:dio/dio.dart';
import '../models/app_config.dart';
import 'package:get_it/get_it.dart';

class HTTPService {
  final Dio dio = Dio();

  AppConfig? _appConfig;
  String? _base_url;

  HTTPService() {
    //access to AppConfig function in the home
    _appConfig = GetIt.instance.get<AppConfig>();
    _base_url = _appConfig!.COIN_API_BASE_URL;
  }

  Future<Response?> get(String path) async {
    try {
      String url = "$_base_url$path";
      //dio works like axios in javascript;
      Response response = await dio.get(url);
      return response;
    } catch (e) {
      print('HTTPService: Unable to perform get request.');
      print(e);
    }
    return null;
  }
}