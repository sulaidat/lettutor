import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/models/course/ebook.dart';
import 'package:url_launcher/url_launcher.dart';

class EbookPage extends StatefulWidget {
  const EbookPage({super.key});

  @override
  State<EbookPage> createState() => _EbookPageState();
}

class _EbookPageState extends State<EbookPage> {
  List<String> links = [
    'https://drive.google.com/drive/folders/1vdnKwSEr9v5yc3gEX90mqeuPdXkx3RY7',
    'https://drive.google.com/drive/u/1/folders/12bQfM5qqauHL_FREpsEr6IZwCARZp3ER',
    'https://drive.google.com/drive/folders/1iqQpILU2BgIz1s46r5RetIz_CPKtVSM7',
    'https://drive.google.com/drive/folders/1CcLROy-GdXX9CUi_bLfXfa45xgvyjXxB?usp=sharing',
    'https://drive.google.com/drive/folders/11zvpU7RTkY8wrzrgP68FSgk5memLhm6q',
  ];

  Widget _buildEbookCard(BuildContext context, Ebook ebook) {
    return EbookCard(
      title: ebook.title,
      author: ebook.author,
      url: ebook.url,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Ebook> ebooks = List.generate(
        10,
        (index) => Ebook(
            title: 'Book Title ${index + 1}',
            author: 'Author ${index + 1}',
            url: links[index % links.length]));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: Text('E-Books'),
                centerTitle: true,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return _buildEbookCard(context, ebooks[index]);
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => vpad(10),
                      itemCount: ebooks.length,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EbookCard extends StatelessWidget {
  final String title;
  final String author;
  final String url;

  EbookCard({required this.title, required this.author, required this.url});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(author),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.link),
              onPressed: () async {
                var ccurl = Uri.parse(url);
                if (await canLaunchUrl(ccurl)) {
                  await launchUrl(ccurl);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Could not launch $url'),
                    ),
                  );
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: url));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('URL copied to clipboard'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
