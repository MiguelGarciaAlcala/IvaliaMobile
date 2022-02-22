import 'dart:async';
import 'dart:typed_data';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ivalia_mobile/tools/permission_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class DownloadManager {
  static Future<String?> downloadFile(String url, String filename) async {
    final permissionFuture = PermissionManager.checkPermissions([Permission.storage]);
    var permissionsGranted = await permissionFuture;

    if (!permissionsGranted) {
      permissionFuture.then((granted) {
        permissionsGranted = granted;
      });
    } else {
      try {
        var uri = Uri.parse(url);
        final response = await http.get(uri);

        if (response.contentLength == 0) {
          throw Exception("File is empty.");
        }

        final tempDir = await getTemporaryDirectory();
        final path = '${tempDir.path}/$filename';
        final file = File(path);

        await file.writeAsBytes(response.bodyBytes);
        return path;
      } catch (ex) {
        return null;
      }
    }
  }
}