import 'package:ivalia_mobile/api/services/news_service.dart';
import 'package:ivalia_mobile/api/services/resources_service.dart';
import 'package:ivalia_mobile/api/services/sections_service.dart';
import 'package:ivalia_mobile/api/services/users_service.dart';

class IvaliaAPI {
  static final instance = IvaliaAPI._internal();

  late NewsService news;
  late SectionsService sections;
  late ResourcesService resources;
  late UsersService users;

  IvaliaAPI._internal() {
    news = NewsService();
    sections = SectionsService();
    resources = ResourcesService();
    users = UsersService();
  }
}