import 'package:flutter/material.dart';
import 'package:state_management_practice/article.dart';
import 'package:state_management_practice/articles_provider.dart';

class ArticleAddPage extends StatefulWidget {
  const ArticleAddPage({super.key});

  @override
  State<ArticleAddPage> createState() => _ArticleAddPageState();
}

class _ArticleAddPageState extends State<ArticleAddPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Article Add Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Spacer(),
            TextField(controller: _controller),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Provider.read<ArticlesState>(context).add(Article(
                  _controller.text,
                  'chooyan',
                ));
              },
              child: const Text('ADD'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
