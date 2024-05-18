import 'package:flutter/material.dart';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

import '../widgets/message.dart';

class GeminiChatBotScreen extends StatefulWidget {
  const GeminiChatBotScreen({super.key});

  @override
  State<GeminiChatBotScreen> createState() => _GeminiChatBotScreenState();
}

class _GeminiChatBotScreenState extends State<GeminiChatBotScreen> {
  final TextEditingController _userInput = TextEditingController();
  final apikey = "AIzaSyDk12qLGmzYT4xMcMbP0BjHFI__Qgn3Gvc";

  final List<Message> _message = [];

  final _focusNode = FocusNode();

  Future<void> talkWithGemini() async {
    final userMsg = _userInput.text;
    setState(() {
      _message
          .add(Message(isUser: true, message: userMsg, date: DateTime.now()));
    });

    final model = GenerativeModel(model: 'gemini-pro', apiKey: apikey);

    final content = Content.text(userMsg);
    final response = await model.generateContent([content]);
    // print("This is the response");

    setState(() {
      _message.add(Message(
          isUser: false, message: response.text ?? "", date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Gemini ChatBot",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // backgroundColor: Colors.black,
        // foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _message.length,
              itemBuilder: (context, index) {
                final message = _message[index];
                return Messages(
                    isUser: message.isUser,
                    message: message.message,
                    date: DateFormat("HH:mm").format(message.date));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    flex: 18,
                    child: TextField(
                      focusNode: _focusNode,
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                      controller: _userInput,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          label: const Text("How Can I Help You")),
                    )),
                const Spacer(),
                IconButton(
                    padding: const EdgeInsets.all(12),
                    iconSize: 25,
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.black),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        shape: WidgetStateProperty.all(const CircleBorder())),
                    onPressed: () {
                      talkWithGemini();
                      _userInput.clear();
                      _focusNode.unfocus();
                    },
                    icon: const Icon(Icons.send))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
