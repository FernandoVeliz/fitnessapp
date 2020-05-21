import 'dart:convert';

import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;


class Sample10 extends StatefulWidget {
  @override
  _Sample10State createState() => _Sample10State();
}

class _Sample10State extends State<Sample10> {
  /*List<DataPoint> _items;
  List<double> _xAxis;*/
  final fromDate = DateTime(2019, 05, 22);
  final toDate = DateTime.now();
  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  void _loadData() async {
    /*await Future.delayed(Duration(seconds: 3));
    final String data =
        '[{"Day":1,"Value":"5"},{"Day":2,"Value":"2"},{"Day":3,"Value":"6"},{"Day":4,"Value":"8"}]';
    final List list = json.decode(data);
    setState(() {
      _items = list
          .map((item) => DataPoint(
              value: double.parse(item["Value"].toString()),
              xAxis: double.parse(item["Day"].toString())))
          .toList();
      _xAxis =
          list.map((item) => double.parse(item["Day"].toString())).toList();
    });*/

  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: BezierChart(
          fromDate: fromDate,
          bezierChartScale: BezierChartScale.WEEKLY,
          toDate: toDate,
          onIndicatorVisible: (val) {
            print("Indicator Visible :$val");
          },
          onDateTimeSelected: (datetime) {
            print("selected datetime: $datetime");
          },
          onScaleChanged: (scale) {
            print("Scale: $scale");
          },
          selectedDate: toDate,
          //this is optional
          footerDateTimeBuilder: (DateTime value, BezierChartScale scaleType) {
            final newFormat = intl.DateFormat('dd/MM');
            return newFormat.format(value);
          },
          series: [
            BezierLine(
              label: "Duty",
              onMissingValue: (dateTime) {
                if (dateTime.day.isEven) {
                  return 10.0;
                }
                return 5.0;
              },
              data: [
                DataPoint<DateTime>(value: 10, xAxis: date1),
                DataPoint<DateTime>(value: 50, xAxis: date2),
              ],
            ),
          ],
          config: BezierChartConfig(
            displayDataPointWhenNoValue: false,
            verticalIndicatorStrokeWidth: 3.0,
            pinchZoom: true,
            physics: ClampingScrollPhysics(),
            verticalIndicatorColor: Colors.black26,
            showVerticalIndicator: true,
            verticalIndicatorFixedPosition: false,
            backgroundColor: Colors.red,
          ),
        ),
      ),
    );
    /*return Center(
      child: _items != null
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black54,
                    Colors.black87,
                    Colors.black87,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Async Bezier Chart - Numbers",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Center(
                    child: Card(
                      elevation: 12,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: BezierChart(
                          bezierChartScale: BezierChartScale.CUSTOM,
                          xAxisCustomValues: _xAxis,
                          footerValueBuilder: (double value) {
                            return "${formatAsIntOrDouble(value)}\ndays";
                          },
                          series: [
                            BezierLine(
                              label: "m",
                              data: _items,
                            ),
                          ],
                          config: BezierChartConfig(
                            startYAxisFromNonZeroValue: false,
                            bubbleIndicatorColor: Colors.white.withOpacity(0.9),
                            footerHeight: 40,
                            verticalIndicatorStrokeWidth: 3.0,
                            verticalIndicatorColor: Colors.black26,
                            showVerticalIndicator: true,
                            verticalIndicatorFixedPosition: false,
                            displayYAxis: true,
                            stepsYAxis: 1,
                            backgroundGradient: LinearGradient(
                              colors: [
                                Colors.red[300],
                                Colors.red[400],
                                Colors.red[400],
                                Colors.red[500],
                                Colors.red,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            snap: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : CircularProgressIndicator(),
    );*/
  }
}
