import 'dart:convert';
import 'package:calibre_carte/common/service/storage_service.dart';
import 'package:calibre_carte/global.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'dart:io';

class ImageCacher {




  downloadCoverImage(token, path) async {
    String url = "https://content.dropboxapi.com/2/files/download";
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Dropbox-API-Arg": jsonEncode({"path": path}),
    };
//    String json = '{"path": $path}'; // make POST request
    Response response = await post(
      url as Uri,
      headers: headers,
    ); // check the status code for the result
    return response;
  }

  downloadThumbnailImage(token, path) async {
//    print("I am in th donlaod thumbanial image method");
//    print(token);
    String url = "https://content.dropboxapi.com/2/files/get_thumbnail";
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Dropbox-API-Arg": jsonEncode({"path": path}),
    };
//    String json = '{"path": $path}'; // make POST request
    Response response = await post(
      url as Uri,
      headers: headers,
    ); // check the status code for the result
    return response;
  }

  Future<bool> downloadAndCacheImage(relativePath, bookID) async {
//    print("I am in the download image method");
    String token = await Global.storageService.getTokenFromPreferences();
//    print(token);
    String basePath = await Global.storageService.getSelectedLibPathFromSharedPrefs();
    String absPath = basePath + relativePath + '/cover.jpg';
//    print(absPath);
    Response response = await downloadCoverImage(token, absPath);
    //Get the bytes, get the temp directory and write a file in temp
    if (response.statusCode != 200) {
//      print(response.statusCode);
      return false;
    }
    String bookTitle = relativePath.split("/")[1];
    List<int> bytes = response.bodyBytes;
    Directory tempDir = await getTemporaryDirectory();
    String pathMetadata = join(tempDir.path + "/cover_${bookID}_$bookTitle.jpg");
    await File(pathMetadata).writeAsBytes(bytes, flush: true);
    return true;
  }

  Future<void> downloadAndCacheImageThumbnail(relativePath, bookID) async {
    String token = await Global.storageService.getTokenFromPreferences();
    String basePath = await Global.storageService.getSelectedLibPathFromSharedPrefs();
    String absPath = basePath + relativePath + '/cover.jpg';
    Response response = await downloadThumbnailImage(token, absPath);
    //Get the bytes, get the temp directory and write a file in temp
    List<int> bytes = response.bodyBytes;
    Directory tempDir = await getTemporaryDirectory();
    String pathMetadata = join(tempDir.path + "/thumbnail_$bookID.jpg");
    await File(pathMetadata).writeAsBytes(bytes, flush: true);
  }

  Future<bool> checkIfCachedFileExists(relativePath, bookID) async {
    String bookTitle = relativePath.split("/")[1];
    Directory tempDir = await getTemporaryDirectory();
    String pathMetadata = join(tempDir.path + "/cover_${bookID}_$bookTitle.jpg");
    return await File(pathMetadata).exists();
  }

  Future<bool> checkIfCachedThumbnailExists(bookID) async {
    Directory tempDir = await getTemporaryDirectory();
    String pathMetadata = join(tempDir.path + "/thumbnail_$bookID.jpg");
    return await File(pathMetadata).exists();
  }

  Future<String> returnCachedImagePath(relativePath, bookID) async {
    String bookTitle = relativePath.split("/")[1];
    Directory tempDir = await getTemporaryDirectory();
    String pathMetadata = join(tempDir.path + "/cover_${bookID}_$bookTitle.jpg");
    return pathMetadata;
  }

  Future<String> returnCachedThumbnailPath(bookID) async {
    Directory tempDir = await getTemporaryDirectory();
    String pathMetadata = join(tempDir.path + "/thumbnail_$bookID.jpg");
    return pathMetadata;
  }
}
