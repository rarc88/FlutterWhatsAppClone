import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;
  ChatScreen({this.chat});

  @override
  _ChatScreen createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> with TickerProviderStateMixin {
  Chat chat;
  final TextEditingController _textFieldController = TextEditingController();
  final List<ChatMessage> messages = <ChatMessage>[];
  bool isTyped = false;

  void _onSummit(String message) {
    _textFieldController.clear();
    isTyped = false;
    ChatMessage _message = ChatMessage(
      message: message,
      animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this,
      ),
      contactName: chat.contactName,
    );
    messages.insert(0, _message);
    var data = chats.firstWhere((c) => c.contactName == chat.contactName);
    data.message = _message.message;
    setState(() {});
    _message.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    chat = widget.chat;
    return Scaffold(
      appBar: AppBar(
        title: Text(chat.contactName),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (_, int index) => messages[index],
              ),
            ),
            Divider(
              height: 1.0,
            ),
            IconTheme(
              data: IconThemeData(color: Theme.of(context).accentColor),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.insert_emoticon),
                    onPressed: () {
                      
                    },
                  ),
                  Flexible(
                    child: TextField(
                      controller: _textFieldController,
                      decoration: InputDecoration.collapsed(hintText: 'Ingresa tu mensaje...'),
                      onChanged: (String text) {
                        text = text.replaceAll(' ', '');
                        isTyped = text.length > 0;
                        setState(() {});
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: () {
                      
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: isTyped ? () { _onSummit(_textFieldController.text); } : null,
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String contactName;
  final String message;
  final AnimationController animationController;
  ChatMessage({this.contactName, this.message, this.animationController});
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: CircleAvatar(
                child: Text(contactName[0]),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(contactName, style: Theme.of(context).textTheme.subhead),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(message),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
}