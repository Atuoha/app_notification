import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/stats_container.dart';
import '../constants/colors.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
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
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            CupertinoIcons.chevron_left,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColor.primaryColor,
        title: const Wrap(
          spacing: 8,
          children: [
            Icon(
              CupertinoIcons.rocket,
              color: Colors.white,
            ),
            Text(
              'Rockets Stats',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your Rocket Starts',
            style: TextStyle(
              color: Colors.grey.withOpacity(0.9),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Image.asset('assets/imgs/stats.png'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatsContainer(
                icon: CupertinoIcons.thermometer_sun,
                stat: '30%',
              ),
              StatsContainer(
                icon: CupertinoIcons.rosette,
                stat: '28%',
                iconColor: Colors.white,
              ),
              StatsContainer(
                icon: CupertinoIcons.square_favorites_alt,
                stat: '52%',
              ),
            ],
          )
        ],
      ),
    );
  }
}
