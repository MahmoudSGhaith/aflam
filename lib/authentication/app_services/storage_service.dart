
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  static Future<void> saveToken(String token)async{
    return storage.write(key: "data", value: token);
  }

  static Future<String?> getToken()async{
    String? token = await storage.read(key: "data");
    return token;
  }

  static Future<void> clearToken()async{
    return storage.deleteAll();
  }
}