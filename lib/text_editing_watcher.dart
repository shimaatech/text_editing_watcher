library text_editing_watcher;

import 'package:flutter/cupertino.dart';

typedef TextWidgetBuilder = Widget Function(String text);

class TextEditingWatcher extends StatefulWidget {
  final TextEditingController controller;
  final TextWidgetBuilder builder;

  TextEditingWatcher({@required this.builder, @required this.controller})
      : assert(builder != null);

  @override
  _TextEditingWatcherState createState() => _TextEditingWatcherState();
}

class _TextEditingWatcherState extends State<TextEditingWatcher> {
  String _text;

  @override
  void initState() {
    super.initState();
    _text = widget.controller.text;
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _text = widget.controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_text);
  }
}
