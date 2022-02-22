import 'package:flutter/material.dart';
import 'package:ivalia_mobile/ui/styles/fonts.dart';
import 'package:ivalia_mobile/ui/widgets/common/padded.dart';

class NoContent extends StatelessWidget {
  final RefreshCallback onRefresh;
  final String label;

  const NoContent({this.label = 'Sin resultados', required this.onRefresh, Key? key}) : super(key: key);

  Future<Widget> loading() async {
    return Future.delayed(
      const Duration(seconds: 5),
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
                opacity: 0.5,
                child: Image.asset('assets/images/no_results.jpg')
            ),
            PaddedWidget.only(
                top: 10,
                bottom: 150,
                child: Text(
                    label,
                    style: FontStyles.medium.copyWith(
                      fontWeight: FontWeight.w500
                    )
                )
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = Scaffold.of(context).appBarMaxHeight!;

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            child: FutureBuilder(
              future: loading(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return snapshot.data as Widget;
                }

                return const CircularProgressIndicator();
              },
            ),
            alignment: Alignment.center,
            height: screenHeight - appBarHeight,
          )
      ),
    );
  }
}