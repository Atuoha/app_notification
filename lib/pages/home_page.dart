import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            onPressed: () => null,
            icon: const Icon(
              CupertinoIcons.cloud_hail,
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
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.secondaryColor,
                ),
                onPressed: () => triggerNetworkNotification(),
                icon: const Icon(
                  CupertinoIcons.news,
                  color: Colors.white,
                ),
                label: const Text(
                  'Network',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.secondaryColor,
                ),
                onPressed: () => triggerEcoNotification(),
                icon: const Icon(
                  CupertinoIcons.tickets,
                  color: Colors.white,
                ),
                label: const Text(
                  'Eco Tickets',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.secondaryColor,
                ),
                onPressed: () => triggerCancelNotification(),
                icon: const Icon(
                  CupertinoIcons.xmark_octagon,
                  color: Colors.white,
                ),
                label: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
