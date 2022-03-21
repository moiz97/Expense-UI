import 'package:expense_ui/widgets/general.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../responsiveness/layout.dart';


class Details extends StatelessWidget {
  Details({Key? key}) : super(key: key);

  LineChartData mainData() {
    List<Color> gradientColors = [
      const Color.fromARGB(255, 18, 226, 77),
      const Color.fromARGB(255, 207, 211, 2),
    ];
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 2:
                return '20k';
              case 3:
                return '30k';
              case 4:
                return '40k';
              case 5:
                return '50k';
              case 6:
                return '60k';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 5),
            FlSpot(4.9, 6),
            FlSpot(6.8, 4),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 5),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  final List<Map<String, dynamic>> _overview = [
    {
      'amount': 24000,
      'currency': 'PKR',
      'type': 'Income',
      'percentage': 12.0,
    },
    {
      'amount': 12000,
      'currency': 'PKR',
      'type': 'Expense',
      'percentage': 8.1,
    },
    {
      'amount': 4000,
      'currency': 'PKR',
      'type': 'Expense',
      'percentage': 4.1,
    },
    {
      'amount': 2000,
      'currency': 'PKR',
      'type': 'Expense',
      'percentage': 2.2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topBar(context),
                Spacers.verticalSpaceLarge(context),
                balance(context),
                Spacers.verticalSpaceLarge(context),
                chart(context),
                Spacers.verticalSpaceLarge(context),
                overviewHeading(context),
                Spacers.verticalSpaceMedium(context), //
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: _overview.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OverviewCard(
                          amount: _overview[index]['amount'],
                          currency: _overview[index]['currency'],
                          type: _overview[index]['type'],
                          percentage: _overview[index]['percentage'],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget overviewHeading(BuildContext context) {
    return Row(
      children: [
        Text("Overview", style: Theme.of(context).textTheme.headline3),
        const Spacer(),
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "This year",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacers.horizontalSpaceTiny(context),
                const Expanded(
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget chart(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 1,
      child: LineChart(mainData()),
    );
  }

  Widget balance(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Total Balance", style: Theme.of(context).textTheme.headline3!),
        Spacers.verticalSpaceSmall(context),
        Text(
          "PKR 250,558",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }

  Widget topBar(context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        const Icon(Icons.person, color: Colors.white),
      ],
    );
  }
}
