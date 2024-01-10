import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Message> messages = [
    Message("Can you help me find a solution to a problem", false),
    Message("Hello", false),
    Message("How can I help you?", true),
    Message("Hello, I'm LISA, your personal assistant.", true),
  ];

  final List<int> colorCodes = <int>[
    600,
    100,
  ];

  void onSubmit(String value, BuildContext context) async {
    if (value.trim().isEmpty) {
      return;
    }

    setState(() {
      messages.insert(0, Message(value.trim(), true));
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Colors.amber,
                  )),
              Expanded(
                  child: ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 14),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: messages[index].isSender == true
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 200),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      color: Colors.amber[
                                          messages[index].isSender == true
                                              ? colorCodes[0]
                                              : colorCodes[1]],
                                      child: Text(messages[index].text)),
                                ),
                              )
                            ],
                          ),
                        );
                      })),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                          child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      maxLines: 3,
                      minLines: 1,
                      controller: _controller,
                      decoration: const InputDecoration(
                          hintText: "Message LISA...",
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(
                                  color: Color(0xFFFF6F00),
                                  style: BorderStyle.solid)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(
                                  color: Color(0xFFFFD54F),
                                  style: BorderStyle.solid))),
                      onSubmitted: (value) => onSubmit(value, context),
                    ),
                  ))),
                  SizedBox(
                      child: IconButton(
                          onPressed: () => onSubmit(_controller.text, context),
                          icon: const Icon(
                            Icons.send_rounded,
                            color: Colors.amber,
                          )))
                ],
              )
            ],
          )),
    );
  }
}

class Message {
  final String text;
  final bool isSender;

  Message(this.text, this.isSender);
}
