import 'dart:typed_data';

import 'package:gcloud/storage.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:mime/mime.dart';
class CloudApi{
  late final auth.ServiceAccountCredentials _credentials;
  auth.AutoRefreshingAuthClient? _client;
  CloudApi(String json)
  : _credentials = auth.ServiceAccountCredentials.fromJson(json);
  Future<ObjectInfo> save(String name,Uint8List imgBytes) async{
    if(_client == null)
        _client = await auth.clientViaServiceAccount(_credentials, Storage.SCOPES);
        var storage = Storage(_client!, "My First Project");
        var bucket = storage.bucket('trash_bucket');
        final type = lookupMimeType(name);
        //print(type!+"  44  ");
        return await bucket.writeBytes(name, imgBytes,metadata: ObjectMetadata(
          contentType: type,
        ));
  }
}