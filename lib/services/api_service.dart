import 'dart:async';
import 'dart:io';

import 'package:CeylonScape/util/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../theme/colors.dart';
import 'auth_service.dart';

class ApiService extends GetConnect {
  final AuthService _authService = Get.find(); // Get a reference to the AuthService

  @override
  void onInit() {
    print("init");
    super.onInit();
    httpClient.baseUrl = baseUrl;
    httpClient.timeout = const Duration(seconds: 10);
  }

  // Function to send a GET request
  Future<Response<T>> sendGetRequest<T>(
    bool isAuthRequired,
    String endpoint, {
    Map<String, String>? headers = const {},
    Map<String, dynamic>? query = const {},
    T Function(dynamic)? decoder,
  }) async {
    try {
      final response = await get(
        baseUrl + endpoint,
        headers: {
          ...headers ?? {},
          // Keep any existing headers
          if (isAuthRequired)
            'Authorization': 'Bearer ${_authService.getBearerToken()}',
          // Add the bearer token header
        },
        query: query,
        decoder: decoder,
      );

      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 401) {
        throw ForceLogoutException("Error: 401 Unauthorized");
      }
      print(response.body);
      return response;
    } catch (error) {
      _handleError(error);
      rethrow;
    }
  }

  // Function to send a POST request
  Future<Response<T>?> sendPostRequest<T>(
    bool isAuthRequired,
    String endpoint, {
    dynamic data,
    Map<String, String>? headers = const {},
    Map<String, dynamic>? query = const {},
    T Function(dynamic)? decoder,
  }) async {
    try {
      final response = await post(
        baseUrl + endpoint,
        data,
        headers: {
          ...headers ?? {},
          // Keep any existing headers
          if (isAuthRequired)
            'Authorization': 'Bearer ${_authService.getBearerToken()}',
          // Add the bearer token header
        },
        query: query,
        decoder: decoder,
      );

      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 401) {
        throw ForceLogoutException("Error: 401 Unauthorized");
      }
      // print(response.body);
      return response;
    } catch (error) {
      _handleError(error);
      // rethrow;
      return null;
    }
  }

  Future<Response<T>?> sendPostRequestWithFiles<T>(
      bool isAuthRequired,
      String endpoint, {
        dynamic data,
        Map<String, String>? headers = const {},
        Map<String, dynamic>? query = const {},
        T Function(dynamic)? decoder,
        bool isMultipart = false,
        List<Map<String, dynamic>>? files, // For file uploads
      }) async {
    try {
      // Add auth header if required
      Map<String, String> finalHeaders = {
        ...headers ?? {},
        if (isAuthRequired)
          'Authorization': 'Bearer ${_authService.getBearerToken()}',
      };

      var response;

      if (isMultipart && files != null) {
        // Handle multipart form-data request
        final request = http.MultipartRequest('POST', Uri.parse(baseUrl + endpoint));

        request.headers.addAll(finalHeaders);

        // Add fields (if any)
        if (data != null && data is Map<String, dynamic>) {
          data.forEach((key, value) {
            request.fields[key] = value.toString();
          });
        }

        // Attach files to request
        for (var fileData in files) {
          final file = http.MultipartFile.fromBytes(
            fileData['field'],
            fileData['bytes'],
            filename: fileData['filename'],
          );
          request.files.add(file);
        }

        // Add query parameters (if any)
        request.fields.addAll(query?.map((key, value) => MapEntry(key, value.toString())) ?? {});

        // Send the multipart request
        final streamedResponse = await request.send();
        response = await http.Response.fromStream(streamedResponse);
      } else {
        // Handle regular POST request
        response = await post(
          baseUrl + endpoint,
          data,
          headers: finalHeaders,
          query: query,
          decoder: decoder,
        );
      }

      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 401) {
        throw ForceLogoutException("Error: 401 Unauthorized");
      }

      return response as Response<T>;
    } catch (error) {
      _handleError(error);
      return null;
    }
  }


  void _handleError(dynamic error) {
    if (error is SocketException) {
      // Handle network/socket errors
      Get.snackbar(
        'Error',
        'Network error occurred',
        colorText: CeylonScapeColor.black0,
      );
    } else if (error is TimeoutException) {
      // Handle timeout errors
      Get.snackbar(
        'Error',
        'Request timed out',
        colorText: CeylonScapeColor.black0,
      );
    } else {
      if (kDebugMode) {
        print("here5");
        print(error);
      }
      // Handle other errors
      Get.snackbar(
        'Error',
        'An error occurred',
        colorText: CeylonScapeColor.black0,
      );

      // Check if the error indicates a need for force logout
      if (error is ForceLogoutException) {
        _authService.forceLogout();
      }
    }
  }
}

class ForceLogoutException implements Exception {
  final String message;

  ForceLogoutException(this.message);

  @override
  String toString() {
    return 'ForceLogoutException: $message';
  }
}
