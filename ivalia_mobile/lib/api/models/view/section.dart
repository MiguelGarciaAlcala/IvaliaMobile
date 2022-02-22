import 'package:ivalia_mobile/api/models/view/subsection.dart';

class Section {
  final int id;
  final String title;
  final String? content;
  List<Subsection>? subsections;

  Section({
    this.id = 0,
    required this.title,
    this.content,
    this.subsections
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String?,
      subsections: Subsection.getSubsections(json['subsections'])
    );
  }
}