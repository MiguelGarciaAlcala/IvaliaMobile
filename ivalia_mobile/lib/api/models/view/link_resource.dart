class LinkResource {
  final int id;
  final String description;
  final String hyperlink;

  LinkResource({required this.id, required this.description, required this.hyperlink});

  factory LinkResource.fromJson(Map<String, dynamic> json) {
    return LinkResource(
        id: json['id'] as int,
        description: json['description'] as String,
        hyperlink: json['hyperlink'] as String
    );
  }
}