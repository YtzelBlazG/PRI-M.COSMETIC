import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ImageUploadService {
  static Future<String?> uploadImage(File? newPictureFile) async {
    if (newPictureFile == null) return null;
    final url = Uri.parse('https://api.cloudinary.com/v1_1/da7fxpp2k/image/upload?upload_preset=ixc5wf4j');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', newPictureFile.path);
    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      throw Exception('Failed to upload image');
    }
    final respData = json.decode(resp.body);
    return respData['secure_url'];
  }
}
