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

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Approved'),
        title: Text(name ?? "-"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text("Category"),
              trailing: Text(category ?? "-"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text("Balance"),
              trailing: Text("$balance"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text("From Date"),
              trailing: Text(fromDate ?? "-"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text("To Date"),
              trailing: Text(toDate ?? "-"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("No of Days"),
              trailing: Text("0.5"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text("Half Day"),
              trailing: Text(halfDay ?? "-"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text("Reason"),
              trailing: Text(reason ?? "-"),
            ),
          ),
        ],
      ),
    );
  }
}
