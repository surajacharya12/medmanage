import 'package:flutter/material.dart';
import 'package:medmanage3/screen/sheduletab1.dart';
import 'package:medmanage3/screen/sheduletab2.dart';
import 'package:medmanage3/screen/sheduletab3.dart';

class Shedulescreen extends StatefulWidget {
  const Shedulescreen({super.key});

  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<Shedulescreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  Color _bellIconColor = Colors.black;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _onBellIconTapped() {
    setState(() {
      _bellIconColor =
          _bellIconColor == Colors.black ? Colors.blue : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Shedule",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: _bellIconColor,
              ),
              onPressed: _onBellIconTapped,
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 235, 235, 235)),
                  color: const Color.fromARGB(255, 241, 241, 241),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 5, 185, 155),
                      width: 3.0,
                    ),
                  ),
                  unselectedLabelColor: const Color.fromARGB(255, 32, 32, 32),
                  labelColor: const Color.fromARGB(255, 5, 185, 155),
                  controller: tabController,
                  tabs: const [
                    Tab(text: "Upcoming"),
                    Tab(text: "Completed"),
                    Tab(text: "Cancel"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  UpcomingTab(),
                  CompletedTab(),
                  CancelTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
