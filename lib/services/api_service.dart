import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/storage_item.dart';

class ApiService {
  // Untuk Android Emulator gunakan 10.0.2.2
  // Untuk device fisik gunakan IP address komputer Anda
  static const baseUrl = 'http://localhost/api_flutter';

  Future<List<StorageItem>> getStorageItems() async {
    try {
      print('$baseUrl/get_storage.php');
      final response = await http.get(
        Uri.parse('$baseUrl/get_storage.php'),
      );
      print("a $response");

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((item) => StorageItem.fromJson(item)).toList();
      } else {
        throw Exception(
            'Failed to load items: Server returned ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: ${e.toString()}');
    }
  }

  Future<bool> addStorageItem(StorageItem item) async {
    try {
      print('Sending request to: $baseUrl/add_storage.php');
      print('Request body: ${item.toJson()}');

      final response = await http.post(
        Uri.parse('$baseUrl/add_storage.php'),
        body: {
          'nama': item.nama,
          'kategori': item.kategori,
          'deskripsi': item.deskripsi,
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return true;
      } else {
        throw Exception(
            'Failed to add item: Server returned ${response.statusCode}');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      throw Exception('Network error: ${e.toString()}');
    }
  }
}
