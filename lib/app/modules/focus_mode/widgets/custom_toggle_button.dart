import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomToggle extends StatefulWidget {
  const CustomToggle({super.key});

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          //top right shadow is a bit darker
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          //bottom right shadow is a bit lighter
          const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1)
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              'Mode is ${selected ? 'on' : 'off'}',
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FlutterSwitch(
            width: MediaQuery.sizeOf(context).width *
                0.35, // Set the desired width
            height: 50.0, // Set the desired height
            toggleSize: 60.0, // Set the desired size of the toggle circle
            activeColor: Colors.black,
            inactiveColor: const Color.fromARGB(255, 187, 182, 182),
            value: selected,
            onToggle: (bool value) {
              setState(
                () {
                  selected = value;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
