import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../exception/customExceptions.dart';

class APIManager {
  final http.Client client;
  APIManager(this.client);
  Future<dynamic> postAPICallWithHeader({String? url, var param, Map<String, String>? headerData}) async {
    log("Calling API: $url");
    log("Calling parameters: ${param}");
    log("Calling parameters: ${headerData}");

    var responseJson;
    try {
      final response = await client.post(Uri.parse(url!), body: param, headers: headerData ?? {});

      log('APIManager.postAPICallWithHeader:${response.body}');
      responseJson = apiResponse(response);
    } on SocketException catch (e) {
      log('APIManager.postAPICallWithHeader: $e');

      throw ServerException('Socket Exception in postAPICallWithHeader :${e.toString()}');
    } catch (e) {
      throw ('Exception in postAPICallWithHeader :${e.toString()}');
    }
    return responseJson;
  }

  Future<dynamic> multipartPostAPI(
    String url,
    var param,
    List<Map> images,
    Map<String, String> headerData,
  ) async {
    debugPrint("Calling API: $url");
    debugPrint("Calling parameters: $param");
    debugPrint(headerData.toString());

    var responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(param);

      debugPrint('fgdf');

      print('APIManager.multipartPostAPI:$images');
      if (images.isNotEmpty) {
        for (var item in images) {
          debugPrint(item.runtimeType.toString());
          String fileName = item['image'].path.split("/").last;
          var stream = http.ByteStream(item['image'].openRead());
          stream.cast();
          debugPrint(stream.toString());
          var length = await item['image'].length();
          var multipartFileSign = http.MultipartFile(item['filename'], stream, length, filename: fileName);
          request.files.add(multipartFileSign);
        }
      }
      request.headers.addAll(headerData);
      http.StreamedResponse streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      debugPrint(response.statusCode.toString());
      responseJson = apiResponse(response);
    } on SocketException catch (_) {
      debugPrint('APIManager.postAPICallWithHeader: $_');
      var response;

      response = '{"message": "Something went wrong, Please try later"}';
      throw FetchDataException(response.toString());
    } catch (e) {
      throw ('Exception in postAPICallWithHeader :${e.toString()}');
    }
    return responseJson;
  }

  Future<dynamic> getWithHeader({String? url, required Map<String, String> headerData}) async {
    log("Calling API: $url");
    log("Calling API header: $headerData");
    var responseJson;
    try {
      final response = await client.get(Uri.parse(url!), headers: headerData);
      responseJson = apiResponse(response);
    } on SocketException catch (e) {
      throw ServerException('Socket Exception in getWithHeader :${e.toString()}');
    } catch (e) {
      throw ('Exception in getWithHeader :${e.toString()}');
    }
    return responseJson;
  }

  dynamic apiResponse(http.Response response) {

    switch (response.statusCode) {
      case 200:
      case 201:
      log('APIManager.apiResponse:${response.body}');
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw ServerException(response.body.toString());
    }
  }
}
