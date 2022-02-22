class Subsection {
  final int id;
  final String title;
  final String content;

  Subsection({this.id = 0, required this.title, required this.content});

  factory Subsection.fromJson(Map<String, dynamic> json) {
    return Subsection(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
    );
  }

  static List<Subsection> getSubsections(List<dynamic> list) {
    return list.map((item) => Subsection.fromJson(item)).toList();
  }
}