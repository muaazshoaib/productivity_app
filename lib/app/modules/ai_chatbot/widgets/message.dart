import 'package:flutter/material.dart';

class Message {
  final bool isUser;
  final String message;
  final DateTime date;

  Message({required this.isUser, required this.message, required this.date});
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;
  const Messages(
      {super.key,
      required this.isUser,
      required this.message,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 15)
          .copyWith(left: isUser ? 100 : 10, right: isUser ? 10 : 100),
      decoration: BoxDecoration(
        color: isUser ? Colors.black : Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          bottomLeft: isUser ? const Radius.circular(20) : Radius.zero,
          topRight: const Radius.circular(10),
          topLeft: const Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.blue),
          ),
          Text(
            date,
            style: TextStyle(
                fontSize: 10, color: isUser ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}
