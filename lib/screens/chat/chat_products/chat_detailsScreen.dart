import 'package:flutter/material.dart';
import 'package:sfuverce_app/custom-icons/custom-icons.dart';
import 'package:sfuverce_app/models/item.dart';

// class ChatDetailScreen extends StatelessWidget {

//  const ChatDetailScreen({
//     Key key,
//     @required this.item,
//     @required this.margin,
//   }) : super(key: key);

//   final Item item;
//   final EdgeInsets margin;

//   @override
//   _ChatDetailScreenState createState() => _ChatDetailScreenState();

// }

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          iconSize: 30.0,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Chat',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(CustomIcons.short_text),
            onPressed: () {},
            color: Colors.black,
            iconSize: 30.0,
          )
        ],
      ),
      //backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _headerChat(context),
                _bodyChat(context),
                // SizedBox(
                //   height: 120,
                // )
              ],
            ),
            _formChat(),
          ],
        ),
      ),
    );
  }

  Widget _headerChat(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 5, //spread radius
            blurRadius: 7, // blur radius
            offset: Offset(0, 2), // changes position of shadow
            //first paramerter of offset is left-right
//second parameter is top to down
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), //border corner radius
      ),
      child: Row(children: [
        Container(
          padding: EdgeInsets.all(14),
          height: 180.0,
          width: 180,
          child: Image(
            alignment: Alignment.bottomLeft,
            image: AssetImage(item.imagePath),
            fit: BoxFit.scaleDown,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 248,
          padding: EdgeInsets.only(top: 50, right: 40),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              item.name + ' - ' + item.price.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _bodyChat(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height - 190,
        padding: EdgeInsets.only(left: 25, right: 25, top: 25),
        width: double.infinity,
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.only(
          //  topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.white,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _itemChat(
              avatar: 'assets/image/5.jpg',
              chat: 1,
              message:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message: 'Okey 🐣',
              time: '18.00',
            ),
            _itemChat(
              avatar: 'assets/image/5.jpg',
              chat: 1,
              message: 'It has survived not only five centuries, 😀',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message:
                  'Contrary to popular belief, Lorem Ipsum is not simply random text. 😎',
              time: '18.00',
            ),
            _itemChat(
              avatar: 'assets/image/5.jpg',
              chat: 1,
              message:
                  'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
              time: '18.00',
            ),
            _itemChat(
              avatar: 'assets/image/5.jpg',
              chat: 1,
              message: '😅 😂 🤣',
              time: '18.00',
            ),
          ],
        ),
      ),
    );
  }

  _itemChat({int chat, String avatar, message, time}) {
    return Row(
      mainAxisAlignment:
          chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /*avatar != null
            ? Avatar(
image: avatar,
                size: 50,
              )
            : Text(
                '$time',
                style: TextStyle(color: Colors.grey.shade400),
              ),*/
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: chat == 0 ? Colors.indigo.shade100 : Colors.indigo.shade50,
              borderRadius: chat == 0
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
            ),
            child: Text('$message'),
          ),
        ),
        chat == 1
            ? Text(
                '$time',
                style: TextStyle(color: Colors.grey.shade400),
              )
            : SizedBox(),
      ],
    );
  }

  Widget _formChat() {
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Type your message...',
              suffixIcon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.indigo),
                padding: EdgeInsets.all(14),
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey[50]),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey[50]),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
