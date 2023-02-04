import 'package:flutter/material.dart';
import 'package:implementing_bloc_patter/bloc/bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key? key, required this.child, required this.bloc})
      : super(key: key);

  static T of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T>? provider =
        context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider!.bloc;
  }

  @override
  State<StatefulWidget> createState() {
    return _BlocProviderState();
  }
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
