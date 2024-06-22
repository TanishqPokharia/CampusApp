import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:campus_app/main.dart';

class MarksGraphWidget extends StatelessWidget {
  const MarksGraphWidget({super.key});

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('CT-1', style: style);
        break;
      case 1:
        text = const Text('CT-BI', style: style);
        break;
      case 2:
        text = const Text('CT-AB', style: style);
        break;
      case 3:
        text = const Text('CLA-1', style: style);
        break;
      case 4:
        text = const Text('CH-1', style: style);
        break;
      case 5:
        text = const Text('CH-2', style: style);
        break;
      case 6:
        text = const Text('CH-3', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 1:
        text = '50%';
        break;
      case 2:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 7,
        minY: 0,
        maxY: 3,
        gridData: FlGridData(
          show: true,
          horizontalInterval: 1,
          verticalInterval: 1,
          getDrawingHorizontalLine: (value) => const FlLine(
              color: Color.fromRGBO(0, 148, 255, 0.2), strokeWidth: 1),
          getDrawingVerticalLine: (value) => const FlLine(
              color: Color.fromRGBO(0, 148, 255, 0.2), strokeWidth: 1),
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: bottomTitleWidgets,
              interval: 1,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: leftTitleWidgets,
              reservedSize: 42,
              interval: 1,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 0),
              FlSpot(1, 1),
              FlSpot(2, 2),
              FlSpot(3, 1.5),
              FlSpot(4, 0.4),
              FlSpot(5, 0.8),
              FlSpot(6, 2.2),
            ],
            color: const Color.fromRGBO(151, 71, 255, 0.7),
            isCurved: true,
            barWidth: context.responsiveSize(2),
            isStrokeCapRound: true,
          ),
        ],
      ),
    );
  }
}
