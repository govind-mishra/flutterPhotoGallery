import 'package:flutter/material.dart';
import 'package:selfieapp/widgets/gallery.dart';

import 'Camera.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _paths = [
    'assets/img/IMG_7254.jpg',
    'assets/img/IMG_7255.jpg',
    'assets/img/IMG_7256.jpg',
    'assets/img/IMG_7269.jpg',
    'assets/img/IMG_7271.jpg',
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
