import 'package:flutter/material.dart';

class ApprovedTab extends StatefulWidget {
  const ApprovedTab({Key? key}) : super(key: key);

  @override
  State<ApprovedTab> createState() => _ApprovedTabState();
}

class _ApprovedTabState extends State<ApprovedTab> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(77, 181, 178, 178),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Approved Screen",
              style: optionStyle),
          ],
        ),
      ),
    );
  }
}