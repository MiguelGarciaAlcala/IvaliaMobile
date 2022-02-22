import 'package:ivalia_mobile/api/models/view/media_link.dart';

class New {
  final int id;
  final String title;
  final String? content;
  final String? hyperlink;
  final bool hasAttachment;
  final String uploadDate;
  final Map<String, MediaLink> links;

  New({
    required this.id,
    required this.title,
    required this.content,
    required this.hyperlink,
    required this.hasAttachment,
    required this.uploadDate,
    required this.links
  });

  factory New.fromJson(Map<String, dynamic> json) {
    return New(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String?,
      hyperlink: json['hyperlink'] as String?,
      hasAttachment: json['hasAttachment'] as bool,
      uploadDate: json['uploadDate'] as String,
      links: MediaLink.getLinks(json['links'])
    );
  }

  String image() {
    var image = links['image']!;
    return image.href;
  }

  String? attachment() {
    var attachment = links['attachment'];
    return attachment?.href;
  }
}