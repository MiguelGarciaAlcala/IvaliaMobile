class FileResource {
  final int id;
  final String description;
  final String resource;
  final String filename;

  FileResource({required this.id, required this.description, required this.resource, required this.filename});

  factory FileResource.fromJson(Map<String, dynamic> json) {
    return FileResource(
        id: json['id'] as int,
        description: json['description'] as String,
        resource: json['resource'] as String,
        filename: json['filename'] as String
    );
  }
}