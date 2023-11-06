import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Send_Message extends StatelessWidget {
  Send_Message({super.key});

  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: const Text("WhatsApp Message",
                style: TextStyle(color: Colors.white)),
          ),
          backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: _textEditingController1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "WhatsApp",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _textEditingController2,
            decoration: InputDecoration(
                hintText: "Message",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: senmsg, child: Text("Send"))
        ]),
      ),
    );
  }

  void senmsg() async {
    String wpUri =
        "https://wa.me/91${_textEditingController1.text}?text=${_textEditingController2.text}";
    await launchUrl(Uri.parse(wpUri));
    _textEditingController1.clear();
    _textEditingController2.clear();
  }
}
