import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.tx,
    @required Function deleteTransaction,
  })  : _deleteTransaction = deleteTransaction,
        super(key: key);

  final Transaction tx;
  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: Container(
          child: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text(NumberFormat.simpleCurrency(locale: 'en_IN')
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
                icon: const Icon(Icons.delete),
                label: const Text('Delete'))
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
  }
}
