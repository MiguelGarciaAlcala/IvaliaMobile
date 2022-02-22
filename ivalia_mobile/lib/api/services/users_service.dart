import 'package:ivalia_mobile/api/models/request/user_login_request.dart';
import 'package:ivalia_mobile/api/models/request/user_recovery_request.dart';
import 'package:ivalia_mobile/api/models/response/api_response.dart';
import 'package:ivalia_mobile/api/services/base_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UsersService extends BaseService {
  final controller = 'Users';

  // POST - /Users/Login
  Future<ApiResponse> login(UserLoginRequest loginRequest) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final url = request(controller: controller, method: 'Login');
      final body = loginRequest.serialize();
      final response = await http.post(url, headers: {'Content-Type': 'application/json'}, body: body);
      apiResponse = ApiResponse.fromJson(convert.jsonDecode(response.body));
    } catch(ex) {
      apiResponse.type = ResponseType.error;
      apiResponse.messages = ex.toString();
    }

    return apiResponse;
  }

  // POST - /Users/Recovery
  Future<ApiResponse> recovery(UserRecoveryRequest recoveryRequest) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final url = request(controller: controller, method: 'Recovery');
      final body = recoveryRequest.serialize();
      final response = await http.post(url, headers: {'Content-Type': 'application/json'}, body: body);
      apiResponse = ApiResponse.fromJson(convert.jsonDecode(response.body));
    } catch(ex) {
      apiResponse.type = ResponseType.error;
      apiResponse.messages = ex.toString();
    }

    return apiResponse;
  }
}