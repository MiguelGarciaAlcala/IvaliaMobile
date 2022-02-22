import 'package:flutter/material.dart';
import 'package:ivalia_mobile/tools/download_manager.dart';
import 'package:ivalia_mobile/ui/styles/colors.dart';
import 'package:ivalia_mobile/ui/widgets/app_bars/page_bar.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  final String url;
  const PdfViewer(this.url, {Key? key}) : super(key: key);

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(
        title: '',
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.download,
                color: ColorStyles.white
              ),
              onPressed: () {
                DownloadManager.downloadFile(widget.url, "document.pdf").then((path) async {
                  if(path != null) OpenFile.open(path);
                }).catchError((error) {});
              }),
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: ColorStyles.white,
              semanticLabel: 'Indice',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        widget.url,
        key: _pdfViewerKey,
      ),
    );
  }
}
