import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

import 'app_body.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    DialogFlowtter.fromFile(
      path: "assets/credentials.json",
      projectId: "apt-cubist-332622",
    ).then(
      (instance) => dialogFlowtter = instance,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Chatbot HELP'),
      ),
      body: Column(
        children: [
          Expanded(child: AppBody(messages: messages)),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            color: Colors.deepOrange,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.send),
                  onPressed: () {
                    sendMessage(_controller.text);
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage(String text) async {
    if (text.isEmpty) return;
    setState(() {
      addMessage(
        Message(text: DialogText(text: [text])),
        true,
      );
    });

    // dialogFlowtter.projectId = "deimos-apps-0905";

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: QueryInput(text: TextInput(text: text)),
    );

    if (response.message == null) return;
    setState(() {
      addMessage(response.message!);
    });
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }

  @override
  void dispose() {
    dialogFlowtter.dispose();
    super.dispose();
  }
}
