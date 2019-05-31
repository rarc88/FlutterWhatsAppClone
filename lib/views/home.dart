import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:whatsapp_clone/views/camera/camera.dart';
import 'package:whatsapp_clone/views/chats/chats.dart';
import 'package:whatsapp_clone/views/status/status.dart';
import 'package:whatsapp_clone/views/calls/calls.dart';
import 'package:whatsapp_clone/views/contacts/contacts.dart';

class Home extends StatefulWidget {
  final List<CameraDescription> cameras;
  Home(this.cameras);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  //Controlador para el TabBar
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, initialIndex: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp Clone'),
        actions: <Widget>[
          Icon(Icons.find_in_page),
          Icon(Icons.list),
        ],
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: 12),
          controller: _tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: 'CHATS'),
            Tab(text: 'ESTADOS'),
            Tab(text: 'LLAMADAS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Camera(widget.cameras),
          Chats(),
          Status(),
          Calls(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () {
          var route = MaterialPageRoute(
            builder: (BuildContext context) => Contacts()
          );
          Navigator.of(context).push(route);
        },
      ),
    );
  }
}