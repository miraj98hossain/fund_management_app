import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_management_app/presentations/home_screen/bloc/transaction_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import "package:collection/collection.dart";

class PerformanceChartScreen extends StatelessWidget {
  const PerformanceChartScreen({super.key});
  static const String routeName = "/performance-chart-screen";
  @override
  Widget build(BuildContext context) {
    return const PerformanceChartScreenBody();
  }
}

class PerformanceChartScreenBody extends StatefulWidget {
  const PerformanceChartScreenBody({super.key});

  @override
  State<PerformanceChartScreenBody> createState() =>
      _PerformanceChartScreenBodyState();
}

class _PerformanceChartScreenBodyState
    extends State<PerformanceChartScreenBody> {
  List<_ChartData> data = [];
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is TransactionLoaded) {
              data.clear();
              var groupedData = groupBy(
                  state.transactions, (transaction) => transaction.type);
              groupedData.forEach(
                (key, value) {
                  num total = 0;
                  value.forEach(
                    (element) {
                      total += element.amount;
                    },
                  );
                  data.add(_ChartData(key, total));
                },
              );
            }
            return SfCircularChart(
              legend: const Legend(
                  isVisible: true,
                  alignment: ChartAlignment.center,
                  position: LegendPosition.left),
              tooltipBehavior: _tooltip,
              series: <CircularSeries<_ChartData, String>>[
                DoughnutSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                  ),
                  enableTooltip: true,
                  explode: true,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final num y;
}
