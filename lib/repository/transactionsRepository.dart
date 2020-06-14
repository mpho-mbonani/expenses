import '../model/transaction.dart';

class TransactionsRepository {
  final List<Transaction> transactions = [
    Transaction(
        id: '1',
        title: 'Xpens 1',
        amount: 299.99,
        date: DateTime.now().subtract(Duration(days: 6))),
    Transaction(
        id: '2',
        title: 'Xpens 2',
        amount: 699.99,
        date: DateTime.now().subtract(Duration(days: 5))),
    Transaction(
        id: '3',
        title: 'Xpens 3',
        amount: 1299.99,
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: '4',
        title: 'Xpens 4',
        amount: 499.99,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: '5',
        title: 'Xpens 5',
        amount: 1799.99,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: '6',
        title: 'Xpens 6',
        amount: 799.99,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(id: '7', title: 'Xpens 7', amount: 99.99, date: DateTime.now()),
  ];
}
