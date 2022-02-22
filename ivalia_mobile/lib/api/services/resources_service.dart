import 'package:ivalia_mobile/api/models/view/link_resource.dart';
import 'package:ivalia_mobile/api/models/view/file_resource.dart';
import 'package:ivalia_mobile/api/services/base_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ResourcesService extends BaseService {
  final controller = 'Resources';

  Future<List<LinkResource>> publicLinks() async {
    var links = <LinkResource>[];
    final url = request(controller: controller, method: 'Hyperlinks');

    try {
      final response = await http.get(url);

      if(response.statusCode == HttpStatus.success) {
        List<dynamic> resources = convert.jsonDecode(response.body);
        links = resources.map((item) => LinkResource.fromJson(item)).toList();
      }
    } catch(ex) {
      links.clear();
    }

    return links;
  }

  Future<List<FileResource>> publicFiles() async {
    var files = <FileResource>[];
    final url = request(controller: controller, method: 'Files');

    try {
      final response = await http.get(url);

      if(response.statusCode == HttpStatus.success) {
        List<dynamic> resources = convert.jsonDecode(response.body);
        files = resources.map((item) => FileResource.fromJson(item)).toList();
      }
    } catch(ex) {
      files.clear();
    }

    return files;
  }
}