import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'dart:async';

import 'package:whatsapp_clone/views/home.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff25D366),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(cameras)
    );
  }
}