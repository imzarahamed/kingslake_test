import 'package:flutter/material.dart';
import 'package:kingslake_test/tabs/applied_tab.dart';
import 'package:kingslake_test/tabs/approved_tab.dart';
import 'package:kingslake_test/tabs/rejected_tab.dart';

// import '../tabs/test_tab.dart';
class BottomTabs extends StatefulWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    AppliedTab(),
    ApprovedTab(),
    RejectedTab(),
    // TestTab()
  ];

  static const List<Widget> _appBarTitleOptions = <Widget>[
    Text('Applied'),
    Text('Approved'),
    Text('Rejected'),
    // Text('TestTab'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Approved'),
        title: _appBarTitleOptions.elementAt(_selectedIndex),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Applied',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up),
            label: 'Approved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_down),
            label: 'Rejected',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.textsms_sharp),
          //   label: 'Test',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}