import 'package:flutter/material.dart';
import 'package:text_editing_watcher/text_editing_watcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 100,
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(),
                    isDense: true,
                  ),
                  controller: _controller,
                ),
              ),

              // use TextEditingWatcher in order to rebuild the Text on changes to the
              // TextFormField
              SizedBox(
                width: 50,
              ),
              TextEditingWatcher(
                controller: _controller,
                builder: (context, text) => Text(
                  'You typed: $text',
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),

          SizedBox(
            height: 30,
          ),
          // use TextEditingWatcher for disabling butting when text is empty
          TextEditingWatcher(
            controller: _controller,
            builder: (context, text) => RaisedButton(
              child: Text('submit'),
              onPressed: text.isNotEmpty ? () {} : null,
            ),
          )
        ],
      ),
    );
  }
}
