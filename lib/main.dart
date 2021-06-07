
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi child"),
      ),
     body: Container(
        width: 200.0,
        height: 100.0,
        color: Colors.yellow,
        child: CustomMultiChildLayout(
          delegate: YourLayoutDelegate(),
          children: <Widget>[
            LayoutId(
              id: YourLayoutDelegate.title,
              child: new Text("This is title",
                  style: TextStyle(fontSize: 20.0, color: Colors.black)),
            ),
            LayoutId(
              id: YourLayoutDelegate.description,
              child: new Text("This is description",
                  style: TextStyle(fontSize: 14.0, color: Colors.red)),
                 ),

          ],
        ),
      ),
    );
  }
}

class YourLayoutDelegate extends MultiChildLayoutDelegate {
  YourLayoutDelegate();

  static const String title = 'title';
  static const String description = 'description';

  @override
  void performLayout(Size size) {
    final BoxConstraints constraints =
    new BoxConstraints(maxWidth: size.width);

    final Size titleSize = layoutChild(title, constraints);
    positionChild(title, new Offset(0.0, 0.0));

    final double descriptionY = titleSize.height;
    layoutChild(description, constraints);
    positionChild(description, new Offset(0.0, descriptionY));
  }

  @override
  bool shouldRelayout(YourLayoutDelegate oldDelegate) => false;
}