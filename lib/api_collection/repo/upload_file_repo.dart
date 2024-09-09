import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quickmeds_user/api_collection/api_models/success_message_model.dart';
import 'package:quickmeds_user/api_collection/api_models/upload_file_model.dart';
import 'package:quickmeds_user/api_collection/config/api_config.dart';

class UploadFileRepo {
  // !-----------------Upload File-----------------
  Future<UploadFileModel> uploadFile(String filePath) async {
    final Map<String, String> headers = {
      'X-Authorization': MyApi.apiKey,
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzE2NzQ1Mzg1LCJleHAiOjE3NDgzMDI5ODV9.5wRlYbaliLtMW57h7YCASiJZsESXS1Ouo6i48zuIyTI",
      // "Authorization":
      //     "Bearer ${await PreferenceManager.get().getAccessToken()}"
      // !Uncomment this line later on
    };

    final uri = Uri.parse('${MyApi.baseUrl}/upload');
    final request = http.MultipartRequest('POST', uri)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('file', filePath));

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return uploadFileModelFromJson(response.body);
      } else {
        final successMessageModel = successMessageModelFromJson(response.body);
        Get.snackbar("Error",
            successMessageModel.message ?? 'An unexpected error occurred.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      log("API Error: ${e.toString()}");
    }
    throw Exception('Failed to upload file');
  }
}
