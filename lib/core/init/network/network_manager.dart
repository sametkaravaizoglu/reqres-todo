// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:reqres_app/app/data/enums/preferences_keys.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import '../../../app/ui/global_widgets/loading_widget.dart';
import '../../base/model/base_model.dart';
import '../../constants/application_constants.dart';
import '../cache/cache_manager.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

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
          printResponseHeaders: false,
          printResponseData: true,
          printResponseMessage: false,
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
    BuildContext? context,
  }) async {
    ReceivePort receivePort = ReceivePort();
    try {
      if (context != null) {
        Loader.show(context, progressIndicator: const LoadingOverlayWidget());
      }
      var data;
      Response<dynamic>? response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: await header(),
        ),
      );
      if (model == null) {
        var value = response.data;
        if (value is Map) {
          value["statusCode"] = response.statusCode;
        }
        return value;
      } else {
        await compute(
          jsonBodyParserWithCompute,
          [model, data ?? response.data, receivePort.sendPort],
        );
        return receivePort.first;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (context != null) {
        if (Loader.isShown) {
          Loader.hide();
        }
      }
      receivePort.close();
    }
  }

  Future post<T extends IBaseModel>({
    required String path,
    T? model,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    BuildContext? context,
    Options? options,
  }) async {
    ReceivePort receivePort = ReceivePort();

    try {
      if (context != null) {
        Loader.show(context, progressIndicator: const LoadingOverlayWidget());
      }

      Response<dynamic>? response = await _dio.post(
        path,
        options: options ?? Options(headers: await header()),
        queryParameters: queryParameters,
        data: data,
      );
      if (model == null) {
        var value = response.data;
        if (value is Map) {
          value["statusCode"] = response.statusCode;
        }
        return value;
      } else {
        await compute(
          jsonBodyParserWithCompute,
          [model, data ?? response.data, receivePort.sendPort],
        );
        return receivePort.first;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (context != null) {
        if (Loader.isShown) {
          Loader.hide();
        }
      }
      receivePort.close();
    }
  }

  Future put<T extends IBaseModel>({
    required String path,
    T? model,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    BuildContext? context,
    Options? options,
  }) async {
    ReceivePort receivePort = ReceivePort();

    try {
      if (context != null) {
        Loader.show(context, progressIndicator: const LoadingOverlayWidget());
      }

      Response<dynamic>? response = await _dio.put(
        path,
        options: options ?? Options(headers: await header()),
        queryParameters: queryParameters,
        data: data,
      );
      if (model == null) {
        var value = response.data;
        if (value is Map) {
          value["statusCode"] = response.statusCode;
        }
        return value;
      } else {
        await compute(
          jsonBodyParserWithCompute,
          [model, data ?? response.data, receivePort.sendPort],
        );
        return receivePort.first;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (context != null) {
        if (Loader.isShown) {
          Loader.hide();
        }
      }
      receivePort.close();
    }
  }

  Future delete<T extends IBaseModel>({
    required String path,
    T? model,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    BuildContext? context,
  }) async {
    ReceivePort receivePort = ReceivePort();
    try {
      if (context != null) {
        Loader.show(context, progressIndicator: const LoadingOverlayWidget());
      }

      Response<dynamic>? response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: await header()),
      );
      if (model == null) {
        var value = response.data;
        if (value is Map) {
          value["statusCode"] = response.statusCode;
        }
        return value;
      } else {
        await compute(
          jsonBodyParserWithCompute,
          [model, data ?? response.data, receivePort.sendPort],
        );
        return receivePort.first;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (context != null) {
        if (Loader.isShown) {
          Loader.hide();
        }
      }
      receivePort.close();
    }
  }

  jsonBodyParserWithCompute<T>(args) async {
    IBaseModel model = args[0];
    dynamic data = args[1];
    SendPort port = args[2];
    try {
      if (data is List) {
        port.send(data.map((e) => model.fromJson(e)).toList().cast<T>());
      } else if (data is Map) {
        port.send(model.fromJson(data));
      } else {
        port.send(data);
      }
    } catch (ex) {
      port.send(data);
    }
  }
}
