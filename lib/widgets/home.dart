import 'package:flutter/material.dart';
import 'package:selfieapp/widgets/gallery.dart';

import 'Camera.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _paths = [
    'assets/img/144066.JPG',
    'assets/img/144093.JPG',
    'assets/img/219010.JPG',
    'assets/img/486003.JPG',
    'assets/img/486018.JPG',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Camera(),
        Align(
          alignment: Alignment(0, 0.95),
          child: Container(
            height: 100.0,
            child: Gallery(
              paths: _paths,
            ),
          ),
        )
      ],
    );
  }
}
