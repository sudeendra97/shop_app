import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/Models/transaction.dart';
import 'package:personal_expense/Widgets/chartbar.dart';

class chart extends StatelessWidget {
  final List<Transaction> recentransactions;
  chart(this.recentransactions);
  List<Map<String, Object>> get groupedtransactionvalues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalsum = 0.0;
      for (var i = 0; i < recentransactions.length; i++) {
        if (recentransactions[i].date.day == weekday.day &&
            recentransactions[i].date.month == weekday.month &&
            recentransactions[i].date.year == weekday.year) {
          totalsum = recentransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalsum
      };
    }).reversed.toList();
  }

  double get totalspending {
    return groupedtransactionvalues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedtransactionvalues);
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //important step below where we call chart bar 7 times
          children: groupedtransactionvalues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  '${data['day']}',
                  (data['amount'] as double),
                  totalspending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalspending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
