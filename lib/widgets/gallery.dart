import 'package:flutter/material.dart';
import 'package:selfieapp/widgets/thumbnail.dart';

class Gallery extends StatelessWidget {

  final List<String> paths;
  const Gallery({Key key, this.paths}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: paths.length,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Thumbnail(
            imagePath: paths[index],
          ),
        );
      }
    );
  }
}