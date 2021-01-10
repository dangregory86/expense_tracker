import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;

  ChartBar(
    this.label,
    this.spendingAmount,
    this.spendingPercentage,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constrains) {
      return Column(
        children: [
          Container(
            height: constrains.maxHeight * 0.1,
            child: FittedBox(
              child: Text('£${spendingAmount.toStringAsFixed(2)}'),
            ),
          ),
          SizedBox(
            height: constrains.maxHeight * 0.1,
          ),
          Container(
            height: constrains.maxHeight * 0.6,
            width: constrains.maxWidth * 0.5,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constrains.maxHeight * 0.1,
          ),
          Container(
            height: constrains.maxHeight * 0.1,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      );
    });
  }
}
