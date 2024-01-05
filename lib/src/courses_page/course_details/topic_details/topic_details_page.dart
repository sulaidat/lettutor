import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:
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
