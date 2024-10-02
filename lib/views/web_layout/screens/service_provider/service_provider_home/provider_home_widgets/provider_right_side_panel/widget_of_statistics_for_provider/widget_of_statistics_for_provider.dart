import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../constants/app_colors/app_colors.dart';

class StatisticGraphWidget extends StatelessWidget {
  const StatisticGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          // margin: EdgeInsets.only(right: 48.w),
          width: size.width * 0.74,
          height: size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.kcPrimaryWhite,
          ),

          child: Container(
            height: size.height * 0.15,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue.shade900, Colors.black],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: BarChart(
                      BarChartData(
                        barGroups: createBarGroups(),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              getTitlesWidget: (value, meta) {
                                // Display only values from 0 to 500 at intervals of 100
                                if (value % 100 == 0) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  );
                                }
                                return Container();
                              },
                            ),
                          ),
                          bottomTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                        ),
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: Colors.white.withOpacity(0.2),
                              strokeWidth: 1,
                            );
                          },
                        ),
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Assigned Appointments',
                  style: TextStyle(
                      color: AppColors.kcPrimaryTextColor, fontSize: 16),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '(+5) ',
                          style: TextStyle(
                            color: Colors.green.withOpacity(0.5),
                            fontSize: 10,
                          )),
                      TextSpan(
                        text: 'than Last Week',
                        style: TextStyle(
                          color:
                              AppColors.kcSecondaryTextColor.withOpacity(0.5),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppColors.kcPrimaryColor),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/admin_appointment.svg',
                            height: size.height * 0.02,
                          ),
                        ),
                      ),
                      title: Text(
                        'Patients',
                        style: TextStyle(
                            color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                            fontSize: 10),
                      ),
                    ),
                    Text(
                      125.toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List<BarChartGroupData> createBarGroups() {
  return [
    _createBarData(0, 300),
    _createBarData(1, 200),
    _createBarData(2, 100),
    _createBarData(3, 400),
    _createBarData(4, 350),
    _createBarData(5, 500),
    _createBarData(6, 300),
    _createBarData(7, 200),
    _createBarData(8, 150),
  ];
}

BarChartGroupData _createBarData(int x, double y) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        width: 10,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    ],
  );
}

class StatisticRowWidgets extends StatelessWidget {
  const StatisticRowWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.74,
      child: Row(
        children: [
          const StatisticContainerWidget(
            count: 385,
            image: 'assets/icons/admin_appointment.svg',
            label: 'Connected Patients',
          ),
          SizedBox(width: size.width * 0.05),
          const StatisticContainerWidget(
            count: 385,
            image: 'assets/icons/admin_provider.svg',
            label: 'Assigned Appointments This Month',
          ),
          SizedBox(width: size.width * 0.05),
          const StatisticContainerWidget(
            count: 385,
            image: 'assets/icons/admin_provider.svg',
            label: 'Total Assigned Appointments',
          ),
        ],
      ),
    );
  }
}

class StatisticContainerWidget extends StatelessWidget {
  final String label;
  final int count;
  final String image;

  const StatisticContainerWidget(
      {super.key,
      required this.label,
      required this.count,
      required this.image});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.kcSecondaryTextColor,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                count.toString(),
                style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.kcPrimaryTextColor,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Container(
            height: size.height * 0.05,
            width: size.width * 0.025,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.kcPrimaryColor,
            ),
            child: Center(
              child: SvgPicture.asset(image),
            ),
          )
        ],
      ),
    ));
  }
}
