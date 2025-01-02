import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class SecureStorageClass{

  Future<String?> getUserToken()async{
    final token = await const FlutterSecureStorage().read(key: 'token');
    return token;
  }


  Future<void> saveUserToken(token)async{
    await const FlutterSecureStorage().write(key: 'token', value: token);
  }

  Future<dynamic> deleteUserToken()async{
    const FlutterSecureStorage().delete(key: 'token');
  }
}