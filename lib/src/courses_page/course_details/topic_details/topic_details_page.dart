import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TopicDetailPage extends StatefulWidget {
  const TopicDetailPage({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  State<TopicDetailPage> createState() => _TopicDetailPageState();
}

class _TopicDetailPageState extends State<TopicDetailPage> {
  int? pages;
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:
            // PDFView(
            //   filePath: widget.url,
            //   enableSwipe: true,
            //   swipeHorizontal: true,
            //   autoSpacing: false,
            //   pageFling: false,
            //   onRender: (_pages) {
            //     setState(() {
            //       pages = _pages;
            //       isReady = true;
            //     });
            //   },
            //   onError: (error) {
            //     print(error.toString());
            //   },
            //   onPageError: (page, error) {
            //     print('$page: ${error.toString()}');
            //   },
            //   onViewCreated: (PDFViewController pdfViewController) {
            //     _controller.complete(pdfViewController);
            //   },
            //   onPageChanged: (int? page, int? total) {
            //     print('page change: $page/$total');
            //   },
            // ),
            SfPdfViewer.network(
          widget.url,
          onDocumentLoadFailed: (details) {
            print("[TopicDetailPage] $details");
          },
        ),
      ),
    );
  }
}
