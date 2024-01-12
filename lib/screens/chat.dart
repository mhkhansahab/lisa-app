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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
      backgroundColor: Colors.white,
      drawer: customDrawer(),
      body: chatBody(),
    );
  }

  Widget chatBody() {
    return Padding(
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
                              constraints: const BoxConstraints(maxWidth: 200),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
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
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Color(0xFFFF6F00),
                                style: BorderStyle.solid)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
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
        ));
  }

  Widget customDrawer() {
    return Drawer(
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 15),
                  child: TextField(
                    maxLines: 1,
                    // controller: _controller,
                    decoration: InputDecoration(
                        hintText: "Search...",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Color(0xFFFF6F00),
                                style: BorderStyle.solid)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Color(0xFFFFE082),
                                style: BorderStyle.solid))),
                    // onSubmitted: (value) => onSubmit(value, context),
                  )),
            ),
            Expanded(
                child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                drawerTile(context, 0, _selectedIndex, "Text 1", _onItemTapped),
                drawerTile(context, 1, _selectedIndex, "Text 2", _onItemTapped),
                drawerTile(context, 2, _selectedIndex, "Text 3", _onItemTapped),
                drawerTile(context, 3, _selectedIndex, "Text 4", _onItemTapped),
                drawerTile(context, 4, _selectedIndex, "Text 5", _onItemTapped),
                drawerTile(context, 5, _selectedIndex, "Text 6", _onItemTapped),
                drawerTile(context, 6, _selectedIndex, "Text 7", _onItemTapped),
                drawerTile(context, 7, _selectedIndex, "Text 8", _onItemTapped),
                drawerTile(context, 8, _selectedIndex, "Text 9", _onItemTapped),
                drawerTile(
                    context, 9, _selectedIndex, "Text 10", _onItemTapped),
                drawerTile(
                    context, 10, _selectedIndex, "Text 11", _onItemTapped),
                drawerTile(
                    context, 11, _selectedIndex, "Text 12", _onItemTapped),
                drawerTile(
                    context, 12, _selectedIndex, "Text 13", _onItemTapped),
                drawerTile(
                    context, 13, _selectedIndex, "Text 14", _onItemTapped),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

Widget drawerTile(BuildContext context, int currentIndex, int selectedIndex,
    String text, Function onItemTapped) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
    margin: EdgeInsets.symmetric(vertical: currentIndex == 0 ? 0 : 5),
    width: double.infinity,
    child: ListTile(
      title: Text(text),
      selected: selectedIndex == currentIndex,
      selectedColor: Colors.black,
      selectedTileColor: Colors.amber[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: () {
        // Update the state of the app
        onItemTapped(currentIndex);
        // Then close the drawer
        Navigator.pop(context);
      },
    ),
  );
}

class Message {
  final String text;
  final bool isSender;

  Message(this.text, this.isSender);
}
