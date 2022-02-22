import 'package:ivalia_mobile/api/models/view/new.dart';
import 'package:ivalia_mobile/api/services/base_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NewsService extends BaseService {
  static const controller = 'News';

  // GET - /News/Public
  Future<List<New>> public() async {
    var news = <New>[];

    try {
      final uri = request(controller: controller, method: 'Public');
      final response = await http.get(uri);

      if(response.statusCode == HttpStatus.success) {
        List<dynamic> publicNews = convert.jsonDecode(response.body);
        news = publicNews.map((item) => New.fromJson(item)).toList();
      }
    } catch (ex) {
      news = <New>[];
    }

    return news;
  }
}