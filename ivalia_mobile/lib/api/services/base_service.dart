class BaseService {
  static const url = 'http://192.169.178.180:85/mobile/api';

  Uri request({required String controller, String method = ''}) {
    final requestUrl = (method != '') ? '$url/$controller/$method' : '$url/$controller';
    return Uri.parse(requestUrl);
  }
}

class HttpStatus {
  static const success = 200;
}