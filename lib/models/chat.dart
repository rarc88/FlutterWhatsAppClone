class Chat {
  final String contactName;
  final String contactImage;
  String message;
  final String messageTime;

  Chat({this.contactName, this.contactImage, this.message, this.messageTime});
}

List<Chat> chats = [
  Chat(
    contactName: 'Roberto Ruiz',
    contactImage: 'https://gravatar.com/avatar/f149265e69aa36174b330420f5ae47f4?s=400&d=robohash&r=x',
    message: 'Hello!',
    messageTime: '06:01'
  ),
  Chat(
    contactName: 'Arelbis Carpio',
    contactImage: 'https://gravatar.com/avatar/450e323e963c1ec99653c23955e6101c?s=400&d=robohash&r=x',
    message: 'How are you?',
    messageTime: '05:57'
  ),
  Chat(
    contactName: 'Ricardo Aranguren',
    contactImage: 'https://gravatar.com/avatar/1780680afa2bf712a257041633a6a099?s=400&d=robohash&r=x',
    message: 'Hi, my brother!',
    messageTime: '05:33'
  ),
];