import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:selfieapp/api/storage.dart';

class Camera extends StatefulWidget {
  final Function() captureCallback;

  const Camera({Key key, this.captureCallback}) : super(key: key);
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<CameraDescription> cameras;
  CameraController _controller;
  bool isCameraIntialized = false;
  void _intializeController() {
    _controller = CameraController(cameras[1], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) return;
      setState(() {
        isCameraIntialized = true;
      });
    });
  }

  _getCameras() async {
    cameras = await availableCameras();
    if (cameras.length > 0) _intializeController();
  }

  @override
  void initState() {
    super.initState();
    _getCameras();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> _captureImage() async {
    var path = await Storage.getFilePath();
    var completer = Completer<String>();
    if (!_controller.value.isTakingPicture)
      try {
        await _controller.takePicture(path);
        //widget.captureCallback();
        completer.complete(path);
      } on CameraException catch (e) {
        throw Exception('Failed to capture image:$e');
      }
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    //calculate ratio of screen size
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    if (!isCameraIntialized)
      return Container();
    else
      return Stack(
        children: <Widget>[
          Transform.scale(
            scale: _controller.value.aspectRatio / deviceRatio,
            child: Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: CameraPreview(_controller),
              ),
            ),
          ),
          Center(
            child: FloatingActionButton(
              child: Icon(
                Icons.camera_alt,
                size: 36.0,
              ),
              onPressed: () {
                _captureImage();
              },
            ),
          )
        ],
      );
  }
}
