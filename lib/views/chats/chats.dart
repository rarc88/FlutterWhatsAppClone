import 'package:flutter/material.dart';
import 'package:whatsapp_clone/views/chats/chatScreen.dart';
import 'package:whatsapp_clone/models/chat.dart';

class Chats extends StatefulWidget {
  @override
  _Chats createState() => _Chats();
}

class _Chats extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, i) => Column(
        children: <Widget>[
          if(i > 0)
            Divider(height: 10.0,),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chats[i].contactImage),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  chats[i].contactName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  chats[i].messageTime,
                  style: TextStyle(
                    color: Colors.grey, fontSize: 14.0,
                  ),
                ),
              ],
            ),
            subtitle: Container(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                chats[i].message,
                style: TextStyle(
                  color: Colors.grey, fontSize: 15.0,
                ),
              ),
            ),
            onTap: () {
              var route = MaterialPageRoute(
                builder: (context) => ChatScreen(chat: chats[i])
              );
              Navigator.of(context).push(route);
            },
          ),
        ],
      )
    );
  }
}