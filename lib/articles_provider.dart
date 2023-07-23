import 'package:flutter/material.dart';
import 'package:state_management_practice/article.dart';

class Provider<T extends ValueNotifier> extends StatefulWidget {
  const Provider({
    super.key,
    required this.create,
    required this.child,
  });

  final T Function() create;
  final Widget child;

  static T watch<T>(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<StateContainer<T>>();
    assert(widget != null, 'No ArticlesContainer found');
    return widget!.state;
  }

  static T read<T>(BuildContext context) {
    final widget = context.getInheritedWidgetOfExactType<StateContainer<T>>();
    assert(widget != null, 'No ArticlesContainer found');
    return widget!.state;
  }

  @override
  State<Provider> createState() => ProviderState<T>();
}

class ProviderState<T extends ValueNotifier> extends State<Provider> {
  late final ValueNotifier state;

  @override
  void initState() {
    super.initState();
    state = widget.create();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: state,
      builder: (context, child) => StateContainer<T>(
        state as T,
        child: widget.child,
      ),
    );
  }
}

class StateContainer<T> extends InheritedWidget {
  const StateContainer(
    this.state, {
    super.key,
    required super.child,
  });

  final T state;

  @override
  bool updateShouldNotify(covariant StateContainer oldWidget) {
    return true;
  }
}

class ArticlesState extends ValueNotifier<List<Article>> {
  ArticlesState() : super([]);

  void add(Article newArticle) {
    value = [...value, newArticle];
  }
}
