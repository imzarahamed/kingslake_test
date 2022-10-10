import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kingslake_test/modules/api_connection.dart';
import 'package:http/http.dart' as http;
import 'package:kingslake_test/screens/detail_screen.dart';

const String api = APIConnection.sPath;

Future<List<PersonData>> fetchPersonData() async {
  http.Response response = await http.get(Uri.parse(api), //url
      headers: {"Accept": "application/json"});
  // debugPrint("response body + ${response.body}");
  if (response.statusCode == 200) {
    // ignore: avoid_print
    // print("Error has tekn place at 200");
    // Map<String, dynamic> map = json.decode(response.body);
    // var map = json.decode(response.body);
    // ignore: avoid_print
    // print("response.body : ${response.body}");
    // ignore: avoid_print
    // print("map : ${map['Data']}");
    List<PersonData> personDataList;
    personDataList = (json.decode(response.body) as List)
        .map((i) => PersonData.fromJson(i))
        .toList();
    // ignore: avoid_print
    print("personal Data List : $personDataList");
    return personDataList;
  } else {
    // ignore: avoid_print
    // print("Error has tekn place at 400");
    // print("Failed to load categories");
    throw Exception('Failed to load People Details');
  }
}

class PersonData {
  final String name;
  final String category;
  final int balance;
  final String fromDate;
  final String toDate;
  final String halfDay;
  final String reason;
  final int approved;

  const PersonData({
    required this.name,
    required this.category,
    required this.balance,
    required this.fromDate,
    required this.toDate,
    required this.halfDay,
    required this.reason,
    required this.approved,
  });

  factory PersonData.fromJson(Map<String, dynamic> json) {
    return PersonData(
      name: json['name'],
      category: json['category'],
      balance: json['balance'],
      fromDate: json['from_date'],
      toDate: json['to_date'],
      halfDay: json['half_day'],
      reason: json['reason'],
      approved: json['approved'],
    );
  }
}

class AppliedTab extends StatefulWidget {
  const AppliedTab({Key? key}) : super(key: key);

  @override
  State<AppliedTab> createState() => _AppliedTabState();
}

class _AppliedTabState extends State<AppliedTab> {
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(77, 181, 178, 178),
      body: Stack(
        children: [
          FutureBuilder<List<PersonData>>(
            future: fetchPersonData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // ignore: avoid_print
                // print("error has taken place at if");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) =>
                        // PersonData snap = snapshot.data!.[index];
                        Card(
                          color: Colors.white,
                          margin: const EdgeInsets.all(20.0),
                          elevation: 0.0,
                          child: SizedBox(
                            height: 100.0,
                            child: InkWell(
                                splashColor: Colors.blueAccent,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PersonDetails(
                                          personData: snapshot.data![index]),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        // ignore: prefer_const_constructors
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          // child: const CircleAvatar(
                                          //   radius: 22, // Image radius
                                          //   backgroundImage: NetworkImage(
                                          //       "assets/images/person.png"),
                                          // ),
                                          child: const CircleAvatar(
                                            radius: 30.0,
                                            backgroundImage: NetworkImage(
                                                'https://via.placeholder.com/150'),
                                            backgroundColor: Colors.transparent,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].name,
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // ignore: prefer_const_constructors
                                        Text(
                                          snapshot.data![index].category,
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black54),
                                        ),
                                        // ignore: prefer_const_constructors
                                        Text(
                                          snapshot.data![index].fromDate,
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black54),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 15.0,
                                          height: 15.0,
                                          // ignore: prefer_const_constructors
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: snapshot.data![index]
                                                        .approved ==
                                                    1
                                                ? Colors.blueAccent
                                                : Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              right: 18.0,
                                              top: 12.0,
                                              bottom: 12.0,
                                              left: 0.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.black38,
                                            size: 26.0,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                // ignore: avoid_print
                // print("error has taken place at else");
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
