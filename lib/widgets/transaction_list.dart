import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                SizedBox(
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
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: Container(
                    child: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                              NumberFormat.simpleCurrency(locale: 'en_IN')
                                  .format(tx.amount)),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    tx.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(DateFormat('dd-MMM-yyyy').format(tx.date)),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          onPressed: () {
                            _deleteTransaction(tx.id);
                          },
                          textColor: Theme.of(context).errorColor,
                          icon: Icon(Icons.delete),
                          label: Text('Delete'))
                      : IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          onPressed: () {
                            _deleteTransaction(tx.id);
                          },
                        ),
                ),
              );
            },
          );
  }
}
