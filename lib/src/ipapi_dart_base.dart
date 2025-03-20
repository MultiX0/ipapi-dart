import 'dart:developer';
import 'package:dio/dio.dart';

import 'constants/constants.dart';
import 'package:ipapi_dart/ipapi_dart.dart';

class IPInfo {
  static Dio dio = Dio();

  static Future<IpInfoModel> queryIP(String ip) async {
    try {
      final res = await dio.get("$baseUrl$ip");
      if (res.statusCode! >= 200 && res.statusCode! <= 299) {
        final data = res.data as Map<String, dynamic>;
        return IpInfoModel.fromMap(data);
      }
      throw DioException(requestOptions: res.requestOptions);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<String> QueryOwnIP() async {
    try {
      final res = await dio.get(baseUrl);
      if (res.statusCode! >= 200 && res.statusCode! <= 299) {
        final data = res.data;
        return data;
      }
      throw DioException(requestOptions: res.requestOptions);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
