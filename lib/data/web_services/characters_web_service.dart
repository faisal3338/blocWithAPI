import 'package:dio/dio.dart';
import 'package:flutter_application_11/constants/strings.dart';

class CharacterWebService {
    late Dio dio;

    CharacterWebService(){
        BaseOptions options = BaseOptions(
            baseUrl: baseUrl,
            receiveDataWhenStatusError: true,
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
            // connectTimeout: 20 * 1000;
            // receiveTimeout: 20 * 1000;
        );
        dio = Dio(options);
    }

    Future<List<dynamic>> getAllCharacters() async {
        try {
            Response response = await dio.get('characters');
            // print(response.data.tostring());
            return response.data;
        }
        on Exception catch (_, e) {
             print(e.toString());
             return [];
        }
    }
}