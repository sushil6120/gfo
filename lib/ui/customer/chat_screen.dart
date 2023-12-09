import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfo/utils/colors.dart';
// import 'package:gfo/utils/responsive.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message);
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLight2,
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorDark1),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Michael tony",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.ellipsis_vertical,
                color: colorDark2,
              )),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                String message = _messages[index];
                bool isSent = index % 2 ==
                    0; // Simple logic to alternate between sent and received messages

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: isSent
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!isSent)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/consultant.jpg'), // Replace with your image asset
                          ),
                        ),
                      Container(
                        
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: isSent ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          message,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      if (isSent)
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/consultant.jpg'), // Replace with your image asset
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextFormField(
                
                controller: _messageController,
                onFieldSubmitted: (_) => _sendMessage(),
                decoration: InputDecoration(
                    hintText: 'Send a message',
                    hintStyle:Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: colorLight3) ,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: colorLight3)),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: colorLight3)),
                    filled: true,
                    fillColor: colorLightWhite),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: greenColor,
              size: 32,
            ),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
