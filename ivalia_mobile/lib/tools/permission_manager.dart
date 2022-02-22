import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  static Future<bool> checkPermissions(List<Permission> permissions) async {
    final missing = <Permission>[];

    for(final permission in permissions) {
      final status = await permission.status;

      if(status != PermissionStatus.granted) {
        missing.add(permission);
      }
    }

    if(missing.isNotEmpty) {
      Map<Permission, PermissionStatus> statuses = await missing.request();

      for (final permission in statuses.keys) {
        if (statuses[permission] != PermissionStatus.granted) {
          return false;
        }
      }
    }

    return true;
  }
}