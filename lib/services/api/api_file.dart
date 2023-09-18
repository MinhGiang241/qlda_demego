import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../models/file_upload_model.dart';
import 'api_services.dart';

class APIFile {
  static Future<List<ResponseFileUpload>> uploadSingleFile({
    required List<File> files,
    OnSendProgress? onSendProgress,
    BuildContext? context,
  }) async {
    List<ResponseFileUpload> results = [];
    if (files.isNotEmpty) {
      for (var i = 0; i < files.length; i++) {
        if (files[i].lengthSync() >= 15728640) {
          throw (S.current.not_upload_15mb);
        }
        final mpf = await MultipartFile.fromFile(files[i].path);
        final map = {
          'file': [mpf],
          'name': files[i].path.split('/').last,
        };
        final body = FormData.fromMap(map);
        final data = await ApiService.shared.postApi(
          path: ApiService.shared.uploadURL, // ApiConstants.uploadURL,
          data: body,
          onSendProgress: onSendProgress,
          name: files[i].path.split('/').last,
          accessToken: ApiService.shared.access_token,
        );

        var file = ResponseFileUpload.fromJson(data);
        if (file.data == null) {
          throw (S.current.err_upload);
        }
        results.add(file);
      }
    }
    return results;
  }
}
