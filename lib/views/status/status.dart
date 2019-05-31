import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/status.dart';

class Status extends StatefulWidget {
  @override
  _Status createState() => _Status();
}

class _Status extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getStatusListTile(),
    );
  }
}

List<Widget> getStatusListTile() {
  final List<Widget> _status = [
    ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://i.imgur.com/1o1zEDM.png'),
      ),
      title: Text(
        'Mi estado',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Container(
        padding: EdgeInsets.only(top: 5.0),
        child: Text(
          'Añadir a mi estado',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15.0,
          ),
        ),
      ),
    ),
    Container(
      color: Color.fromRGBO(230, 228, 228, 0.5),
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Recientes',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    ),
  ];
  
  for(var item in status) {
    if(status.indexOf(item) > 0)
      _status.add(Divider(height: 10.0));
    _status.add(
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.image),
        ),
        title: Text(
          item.contactName,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Container(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            item.date,
            style: TextStyle(
              color: Colors.grey, fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }
  return _status;
}