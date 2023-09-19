// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reqres_app/core/constants/application_constants.dart';
// ignore: depend_on_referenced_packages
import 'package:talker_dio_logger/talker_dio_logger.dart';
import '../../../app/data/enums/preferences_keys.dart';
import '../../base/model/base_model.dart';
import '../cache/cache_manager.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager get instance {
    _instance ??= NetworkManager._init();

    return _instance!;
  }

  String? uid;

  NetworkManager._init() {
    initManager();
  }

  initManager() async {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: ApplicationConstants.instance.baseURL,
      headers: await header(),
      validateStatus: (_) => true,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    _dio = Dio(baseOptions);

    _dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseData: true,
        ),
      ),
    );
  }

  Future<Map<String, String>?> header() async {
    String? token = await CacheManager.instance.getValue(PreferencesKeys.token);
    return {
      "Charset": "utf-8",
      "Accept": "application/json",
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  late Dio _dio;

  Dio get dio => _dio;

  Future get<T extends IBaseModel>({
    required String path,
    T? model,
    Map<String, dynamic>? queryParameters,
  }) async {
    var res;

    try {
      Response<dynamic>? response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: await header(),
        ),
      );

      if (model == null) {
        res = response.data;

        if (res is Map) {
          res["statusCode"] = response.statusCode;
        }
      } else {
        res = _jsonBodyParser<T>(model, response.data, response);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return res;
  }

  Future post<T extends IBaseModel>({
    required String path,
    T? model,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    var res;

    try {
      Response response = await _dio.post(
        path,
        options: options ?? Options(headers: await header()),
        queryParameters: queryParameters,
        data: jsonEncode(data),
      );

      if (model == null) {
        res = response.data;

        if (res is Map) {
          res["statusCode"] = response.statusCode;
        }
      } else {
        res = _jsonBodyParser<T>(model, response.data, response);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return res;
  }

  dynamic _jsonBodyParser<T>(IBaseModel model, dynamic jsonBody, response) async {
    try {
      if (jsonBody is List) {
        return jsonBody.map((e) => model.fromJson(e)).toList().cast<T>();
      } else if (jsonBody is Map) {
        return model.fromJson(jsonBody);
      } else {
        return jsonBody;
      }
    } catch (ex) {
      return response;
    }
  }
}
