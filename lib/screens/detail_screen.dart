import 'package:flutter/material.dart';

import '../tabs/applied_tab.dart';

class PersonDetails extends StatefulWidget {
  final PersonData? personData;
  const PersonDetails({Key? key, this.personData}) : super(key: key);
  @override
  State<PersonDetails> createState() => _PersonDetailsState();
}

class _PersonDetailsState extends State<PersonDetails> {
  @override
  Widget build(BuildContext context) {
    final productdata = widget.personData;
    final String? name = productdata?.name;
    final String? category = productdata?.category;
    final int? balance = productdata?.balance;
    // ignore: avoid_print
    print("balance: $balance");
    final String? fromDate = productdata?.fromDate;
    final String? toDate = productdata?.toDate;
    final String? halfDay = productdata?.halfDay;
    final String? reason = productdata?.reason;
    // final int? approved = productdata?.approved;
    final ButtonStyle style1 =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    final ButtonStyle style2 =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Approved'),
        title: Text(name ?? "-"),
      ),
      backgroundColor: const Color.fromARGB(77, 246, 245, 245).withOpacity(0.9),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 2.0),
                child: ListTile(
                  title: const Text("Category"),
                  trailing: Text(category ?? "-"),
                  tileColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 20.0),
                child: ListTile(
                  title: const Text("Balance"),
                  trailing: Text("$balance"),
                  tileColor: Colors.white,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 2.0),
                child: ListTile(
                  title: const Text("From Date"),
                  trailing: Text(fromDate ?? "-"),
                  tileColor: Colors.white,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 2.0),
                child: ListTile(
                  title: const Text("To Date"),
                  trailing: Text(toDate ?? "-"),
                  tileColor: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
                child: ListTile(
                  title: Text("No of Days"),
                  trailing: Text("0.5"),
                  tileColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 20.0),
                child: ListTile(
                  title: const Text("Half Day"),
                  trailing: Text(halfDay ?? "-"),
                  tileColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: ListTile(
                  title: const Text("Reason"),
                  trailing: Text(reason ?? "-"),
                  tileColor: Colors.white,
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: style1,
                    onPressed: () {},
                    child: const Text('Reject'),
                  ),
                  ElevatedButton(
                    style: style2,
                    onPressed: () {},
                    child: const Text('Approve'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
