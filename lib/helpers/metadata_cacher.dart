import 'dart:convert';
import 'package:calibre_carte/global.dart';
import 'package:calibre_carte/helpers/cache_invalidator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import '../helpers/db_helper.dart';

class MetadataCacher {
  //Should make a shared preferences helper


  downloadMetadata(token, path) async {
    String url = "https://content.dropboxapi.com/2/files/download";
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Dropbox-API-Arg": jsonEncode({"path": path}),
    };
    try {
      Response response = await post(
        url as Uri,
        headers: headers,
      );
      return response;
    } on SocketException catch (_) {
      return null;
    }
  }

  Future<int> downloadAndCacheMetadata({required String token, required String path}) async {
    String _path;
    String _token = await Global.storageService.getTokenFromPreferences() ?? token;
    if (path == null) {
      _path = await Global.storageService.getSelectedLibPathFromSharedPrefs();
    } else {
       _path = path;
    }
    String absPath = _path + 'metadata.db';
    Response response = await downloadMetadata(_token, absPath);
    //Get the bytes, get the temp directory and write a file in temp
    if (response == null) {
      return 0;
    } else {
      if (response.statusCode == 200) {
        await DatabaseHelper.deleteDb();
        await CacheInvalidator.invalidateImagesCache();
        List<int> bytes = response.bodyBytes;
        String tempDir = await getDatabasesPath();
        String pathMetadata = join(tempDir + "/metadata.db");
        await File(pathMetadata).writeAsBytes(bytes, flush: true);
        return 1;
      } else {
        return response.statusCode;
      }
    }
  }

  Future<bool> checkIfCachedFileExists() async {
    Directory tempDir = await getTemporaryDirectory();
    String pathMetadata = join(tempDir.path + "metadata.db");
    return await File(pathMetadata).exists();
  }

  Future<String> returnCachedMetadataPath(bookID) async {
    Directory tempDir = await getTemporaryDirectory();
    String pathMetadata = join(tempDir.path + "/cover_$bookID.jpg");
    return pathMetadata;
  }
}
