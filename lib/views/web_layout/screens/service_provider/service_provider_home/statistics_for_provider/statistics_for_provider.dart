import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../provider_home_widgets/provider_right_side_panel/widget_of_statistics_for_provider/widget_of_statistics_for_provider.dart';

class StatisticsForProvider extends StatelessWidget {
  const StatisticsForProvider({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      // height: size.height,
      width: size.width,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StatisticRowWidgets(),
          SizedBox(height: 32),
          StatisticGraphWidget()
        ],
      ),
    );
  }
}
