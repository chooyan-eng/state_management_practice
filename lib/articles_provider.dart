import 'package:flutter/material.dart';
import 'package:state_management_practice/article.dart';

class ArticlesProvider extends StatefulWidget {
  const ArticlesProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ArticlesProvider> createState() => ArticlesProviderState();
}

class ArticlesProviderState extends State<ArticlesProvider> {
  final articles = <Article>[];

  static ArticlesProviderState of(BuildContext context) {
    final state = context.findAncestorStateOfType<ArticlesProviderState>();
    assert(state != null, 'No ArticlesProviderState found');
    return state!;
  }

  void add(Article newArticle) {
    setState(() {
      articles.add(newArticle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ArticlesContainer(
      articles,
      child: widget.child,
    );
  }
}

class ArticlesContainer extends InheritedWidget {
  const ArticlesContainer(
    this.articles, {
    super.key,
    required super.child,
  });

  static ArticlesContainer of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<ArticlesContainer>();
    assert(widget != null, 'No ArticlesContainer found');
    return widget!;
  }

  final List<Article> articles;

  @override
  bool updateShouldNotify(covariant ArticlesContainer oldWidget) {
    return true;
  }
}
