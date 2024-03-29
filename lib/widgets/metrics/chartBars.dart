import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double totalSpendingPercentage;

  ChartBar(this.label, this.spendingAmount, this.totalSpendingPercentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text('R${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.05),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: FractionallySizedBox(
                    heightFactor: totalSpendingPercentage,
                    child: Container(
                        decoration: BoxDecoration(
                      color: Colors.amber,
                      // expense bar colours should be red amber green
                      // based on categories expense revenue profit
                      borderRadius: BorderRadius.circular(10),
                      // the bars have to be inverted
                    )),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.05),
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(label)))
        ],
      );
    });
  }
}
