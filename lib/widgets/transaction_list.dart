import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;
  TransactionList(this._transactions, this._deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (context, index) {
              final tx = _transactions[index];
              return TransactionItem(
                  tx: tx, deleteTransaction: _deleteTransaction);
            },
          );
  }
}
