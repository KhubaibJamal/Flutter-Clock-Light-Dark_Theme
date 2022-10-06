import 'package:clock_flutter/Pages/clock_page.dart';
import 'package:clock_flutter/Pages/stopwatch_page.dart';
import 'package:clock_flutter/Widget/change_theme_button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// List<Tab> tabs = <Tab>[
//   Tab(
//     icon: Icon(Icons.watch_later_outlined),
//     text: "Clock",
//   ),
//   Tab(
//     icon: Icon(Icons.timer, color: Theme.of(context).iconTheme.color),
//     text: "Stopwatch",
//   ),
// ];

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        // centerTitle: true,
        title: Text(
          "Clock",
          style: TextStyle(
            fontFamily: 'Helvetica',
            fontStyle: FontStyle.italic,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          ChangeThemeButtonWidget(),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              child: Text(
                "Clock",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
            Tab(
              child: Text(
                "Stopwatch",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
          ],
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          indicatorColor: Theme.of(context).primaryColor,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          ClockPage(),
          StopwatchPage(),
        ],
      ),
    );
  }
}
