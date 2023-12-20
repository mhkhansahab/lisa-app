import 'package:flutter/material.dart';
import 'package:lisa_bot/icons/custom_icons.dart';
import 'constant.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 250),
                child: const Text(title,
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(description,
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey)),
              ),
              onboardingTile(
                  lisaInaccurateTitle,
                  lisaInaccurateDesc,
                  const Icon(
                    CustomIcons.telescope,
                    color: Colors.green,
                  )),
              onboardingTile(
                  sensitiveInfoTitle,
                  sensitiveInfoDesc,
                  const Icon(
                    CustomIcons.lock,
                    color: Colors.blue,
                  )),
              onboardingTile(
                  chatHistoryTitle,
                  chatHistoryDesc,
                  const Icon(
                    CustomIcons.settings,
                    color: Colors.pink,
                  )),
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))),
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
          child: const Center(
            child: Text(
              "Continue",
              style: TextStyle(color: Colors.white),
            ),
          ),
          onPressed: () => 0,
        ),
      ),
    );
  }

  Widget onboardingTile(String title, String description, Icon tileIcon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: tileIcon),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black,
                        )),
                    Text(description,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.blueGrey))
                  ],
                )))
      ]),
    );
  }
}
