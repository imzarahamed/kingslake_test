import 'package:flutter/material.dart';

class RejectedTab extends StatefulWidget {
  const RejectedTab({Key? key}) : super(key: key);

  @override
  State<RejectedTab> createState() => _RejectedTabState();
}

class _RejectedTabState extends State<RejectedTab> {
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
              'Rejected Screen',
              style: optionStyle,
            ),
          ],
        ),
      ),
    );
  }
}