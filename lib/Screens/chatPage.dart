import 'package:flutter/material.dart';

class ChatUsers {
  final String text;
  final String secondaryText;
  final String image;
  final String time;

  ChatUsers({
    required this.text,
    required this.secondaryText,
    required this.image,
    required this.time,
  });
}

class ChatPage extends StatelessWidget {
  final List<ChatUsers> chatUsers = [
    ChatUsers(
      text: "Jane Russel",
      secondaryText: "Awesome Setup",
      image: "images/userImage1.jpeg",
      time: "Now",
    ),
    ChatUsers(
      text: "Glady's Murphy",
      secondaryText: "That's Great",
      image: "images/userImage2.jpeg",
      time: "Yesterday",
    ),
    ChatUsers(
      text: "Jorge Henry",
      secondaryText: "Hey where are you?",
      image: "images/userImage3.jpeg",
      time: "31 Mar",
    ),
    ChatUsers(
      text: "Philip Fox",
      secondaryText: "Busy! Call me in 20 mins",
      image: "images/userImage4.jpeg",
      time: "28 Mar",
    ),
    ChatUsers(
      text: "Debra Hawkins",
      secondaryText: "Thank you, It's awesome",
      image: "images/userImage5.jpeg",
      time: "23 Mar",
    ),
    ChatUsers(
      text: "Jacob Pena",
      secondaryText: "Will update you in the evening",
      image: "images/userImage6.jpeg",
      time: "17 Mar",
    ),
    ChatUsers(
      text: "Andrey Jones",
      secondaryText: "Can you please share the file?",
      image: "images/userImage7.jpeg",
      time: "24 Feb",
    ),
    ChatUsers(
      text: "John Wick",
      secondaryText: "How are you?",
      image: "images/userImage8.jpeg",
      time: "18 Feb",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Conversations",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.pink,
                            size: 20,
                          ),
                          SizedBox(width: 2),
                          Text(
                            "Add New",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].text,
                  messageText: chatUsers[index].secondaryText,
                  imageUrl: chatUsers[index].image,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ConversationList extends StatelessWidget {
  final String name;
  final String messageText;
  final String imageUrl;
  final String time;
  final bool isMessageRead;

  ConversationList({
    required this.name,
    required this.messageText,
    required this.imageUrl,
    required this.time,
    required this.isMessageRead,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        maxRadius: 30,
      ),
      title: Text(name),
      subtitle: Text(
        messageText,
        style: TextStyle(
          color: isMessageRead ? Colors.black : Colors.grey.shade600,
          fontWeight: isMessageRead ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: Text(
        time,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isMessageRead ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        // Handle the tap on a conversation item
      },
    );
  }
}
