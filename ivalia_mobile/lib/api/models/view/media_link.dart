class MediaLink {
  final String rel;
  final String href;
  final String method;

  MediaLink({required this.rel, required this.href, required this.method});

  factory MediaLink.fromJson(Map<String, dynamic> json) {
    return MediaLink(
      rel: json['rel'] as String,
      href: json['href'] as String,
      method: json['method'] as String
    );
  }

  static Map<String, MediaLink> getLinks(List<dynamic> links) {
    var items = <String, MediaLink>{};

    for(var link in links) {
      var item = MediaLink.fromJson(link);
      items[item.rel] = item;
    }

    return items;
  }
}