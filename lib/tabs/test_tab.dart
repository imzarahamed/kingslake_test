// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:kingslake_test/tabs/applied_tab.dart';

// Future<Album> fetchAlbum() async {
//   final response = await http.get(Uri.parse(api));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class Album {
//   final String? name;

//   const Album({
//     this.name,
//   });

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       name: json['name'] as String?,
//     );
//   }
// }

// void main() => runApp(const TestTab());

// class TestTab extends StatefulWidget {
//   const TestTab({super.key});

//   @override
//   State<TestTab> createState() => _TestTabState();
// }

// class _TestTabState extends State<TestTab> {
//   late Future<Album> futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         // appBar: AppBar(
//         //   title: const Text('Fetch Data Example'),
//         // ),
//         body: Center(
//           child: FutureBuilder<Album>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Expanded(child: ListView.builder(
//                     itemBuilder: (BuildContext context, int index) {
//                   Text(snapshot.data[index].name ?? "No name");
//                 }));
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }

//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
