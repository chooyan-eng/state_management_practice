import 'package:flutter/material.dart';
import 'package:state_management_practice/article_add_page.dart';
import 'package:state_management_practice/articles_provider.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final articles = ArticlesContainer.of(context).articles;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Article List Screen'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            articles[index].title,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ArticleAddPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
