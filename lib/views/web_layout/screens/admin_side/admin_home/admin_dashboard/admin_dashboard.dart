import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors/app_colors.dart';
import '../../../service_provider/service_provider_home/provider_home_widgets/provider_right_side_panel/widget_of_statistics_for_provider/widget_of_statistics_for_provider.dart';
import 'widgets/dashboard_top_bar.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          dashboardTopBar(size: size, context: context),
          const SizedBox(height: 16),
          dashboardGraphs(context: context, size: size)
        ],
      ),
    );
  }

  Widget dashboardGraphs({
    required Size size,
    required BuildContext context,
  }) {
    return Row(
      children: [
        graphContainer1(graphNo: 1, size: size),
        const SizedBox(width: 24),
        graphContainer1(graphNo: 2, size: size),
      ],
    );
  }

  Widget graphContainer1({required Size size, required int graphNo}) {
    return Expanded(
      flex: graphNo == 1 ? 5 : 7,
      child: Container(
        height: size.height * 0.5,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.kcgreyFieldColor.withOpacity(0.3),
              offset: const Offset(0, 3),
              blurRadius: 3,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: graphNo == 1
            ? graph1Data(size: size, activeUsers: 2000)
            : graph2Data(),
      ),
    );
  }

  Widget graph1Data({required Size size, required int activeUsers}) {
    return Padding(
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
          const SizedBox(height: 16),
          const Text(
            "Active Users",
            style: TextStyle(fontSize: 12, color: AppColors.kcPrimaryTextColor),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '(+23) ',
                    style: TextStyle(
                      color: Colors.green.withOpacity(0.5),
                      fontSize: 10,
                    )),
                TextSpan(
                  text: 'than Last Week',
                  style: TextStyle(
                    color: AppColors.kcSecondaryTextColor.withOpacity(0.5),
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
                  child: Image.asset('assets/icons/provider.png'),
                ),
                title: Text(
                  'Users',
                  style: TextStyle(
                      color: AppColors.kcgreyFieldColor.withOpacity(0.5),
                      fontSize: 10),
                ),
              ),
              Text(
                activeUsers.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget graph2Data() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Usage Stats",
            style: TextStyle(fontSize: 12, color: AppColors.kcPrimaryTextColor),
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '(+5) more ',
                    style: TextStyle(
                      color: Colors.green.withOpacity(0.5),
                      fontSize: 10,
                    )),
                TextSpan(
                  text: 'in 2021',
                  style: TextStyle(
                    color: AppColors.kcSecondaryTextColor.withOpacity(0.5),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(16),
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          if (value % 100 == 0) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 12),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                    bottomTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: true)),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: const FlGridData(show: true),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: 500,
                  lineBarsData: [
                    _createLineBarData(
                      isCurved: true,
                      color: Colors.teal.withOpacity(0.5),
                      spots: [
                        const FlSpot(0, 200),
                        const FlSpot(1, 150),
                        const FlSpot(2, 300),
                        const FlSpot(3, 250),
                        const FlSpot(4, 350),
                        const FlSpot(5, 200),
                        const FlSpot(6, 400),
                        const FlSpot(7, 300),
                        const FlSpot(8, 250),
                        const FlSpot(9, 350),
                        const FlSpot(10, 400),
                      ],
                    ),
                    _createLineBarData(
                      isCurved: true,
                      color: Colors.tealAccent.withOpacity(0.3),
                      spots: [
                        const FlSpot(0, 100),
                        const FlSpot(1, 80),
                        const FlSpot(2, 200),
                        const FlSpot(3, 150),
                        const FlSpot(4, 250),
                        const FlSpot(5, 100),
                        const FlSpot(6, 300),
                        const FlSpot(7, 200),
                        const FlSpot(8, 150),
                        const FlSpot(9, 250),
                        const FlSpot(10, 300),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartBarData _createLineBarData({
    required List<FlSpot> spots,
    required bool isCurved,
    required Color color,
  }) {
    return LineChartBarData(
      spots: spots,
      isCurved: isCurved,
      color: Colors.white,
      barWidth: 3,
      isStrokeCapRound: true,
      belowBarData: BarAreaData(
        show: true,
        color: Colors.blue.withOpacity(0.3),
      ),
    );
  }
}
