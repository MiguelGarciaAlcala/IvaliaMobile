import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ivalia_mobile/api/ivalia_api.dart';
import 'package:ivalia_mobile/api/models/view/new.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:ivalia_mobile/ui/widgets/drawers/public_drawer.dart';
import 'package:ivalia_mobile/ui/widgets/common/no_content.dart';
import '../list_views/lists/public_news_list.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<New>> news;

  Future<void> loadNews() async {
    setState(() {
      news = IvaliaAPI.instance.news.public();
    });
  }

  @override
  void initState() {
    loadNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PageBar(
          title: 'Ivalia Móvil',
          actions: [
            IconButton(
                splashColor: ColorStyles.white,
                icon: const Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const LoginPage()
                  ));
                })
          ]
      ),
      drawer: const PublicDrawer(),
      body: FutureBuilder(
        future: news,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            final publicNews = snapshot.data as List<New>;

            if(publicNews.isNotEmpty) {
              return PublicNewsList(
                items: publicNews,
                onRefresh: loadNews
              );
            }
          }

          return NoContent(onRefresh: loadNews);
        },
      ),
    );
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then((onGoBack));
  }
}

