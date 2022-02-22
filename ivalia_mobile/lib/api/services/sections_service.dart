import 'dart:convert' as convert;
import 'package:ivalia_mobile/api/models/view/section.dart';
import 'package:ivalia_mobile/api/services/base_service.dart';
import 'package:http/http.dart' as http;
import 'package:ivalia_mobile/api/static/sections.dart';

class SectionsService extends BaseService {
  final controller = "Sections";

  List<Section> defaultPublic() {
    return Sections.public();
  }

  // GET - /Sections/Public
  Future<List<Section>> public() async {
    var sections = <Section>[];

    try {
      final uri = request(controller: controller, method: "Public");
      final response = await http.get(uri);

      if(response.statusCode == HttpStatus.success) {
        List<dynamic> sectionList = convert.jsonDecode(response.body);
        sections = sectionList.map((item) => Section.fromJson(item)).toList();
      }
    } catch(ex) {
      sections = <Section>[];
    }

    return sections;
  }


}