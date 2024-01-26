import 'package:app_notifications/pages/stats_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/customElevatedButton.dart';
import '../constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void triggerNetworkNotification() {
    // Todo
  }

  void triggerCancelNotification() {
    // Todo
  }

  void triggerEcoNotification() {
    // Todo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Wrap(
          spacing: 8,
          children: [
            Icon(
              CupertinoIcons.rocket,
              color: Colors.white,
            ),
            Text(
              'Rockets',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const StatsPage(),
              ),
            ),
            icon: const Icon(
              CupertinoIcons.chart_bar_square,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/imgs/rocket.png'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomElevatedButton(
                function: triggerNetworkNotification,
                title: 'Network',
                icon: CupertinoIcons.news,
              ),
              CustomElevatedButton(
                function: triggerEcoNotification,
                title: 'Eco Tickets',
                icon: CupertinoIcons.tickets,
              ),
              CustomElevatedButton(
                function: triggerCancelNotification,
                title: 'Cancel',
                icon: CupertinoIcons.xmark_octagon,
              ),
            ],
          )
        ],
      ),
    );
  }
}
