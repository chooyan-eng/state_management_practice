import 'package:flutter/material.dart';
import 'package:state_management_practice/article.dart';

class ArticlesProvider extends StatefulWidget {
  const ArticlesProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  static ArticlesState watch(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<ArticlesContainer>();
    assert(widget != null, 'No ArticlesContainer found');
    return widget!.state;
  }

  static ArticlesState read(BuildContext context) {
    final widget = context.getInheritedWidgetOfExactType<ArticlesContainer>();
    assert(widget != null, 'No ArticlesContainer found');
    return widget!.state;
  }

  @override
  State<ArticlesProvider> createState() => ArticlesProviderState();
}

class ArticlesProviderState extends State<ArticlesProvider> {
  final state = ArticlesState();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: state,
      builder: (context, child) => ArticlesContainer(
        state,
        child: widget.child,
      ),
    );
  }
}

class ArticlesContainer extends InheritedWidget {
  const ArticlesContainer(
    this.state, {
    super.key,
    required super.child,
  });

  final ArticlesState state;

  @override
  bool updateShouldNotify(covariant ArticlesContainer oldWidget) {
    return true;
  }
}

class ArticlesState extends ValueNotifier<List<Article>> {
  ArticlesState() : super([]);

  void add(Article newArticle) {
    value = [...value, newArticle];
  }
}
