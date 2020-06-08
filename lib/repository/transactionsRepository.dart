import '../model/transaction.dart';

class TransactionsRepository {
  final List<Transaction> transactions = [
    Transaction(
        id: '1',
        title: 'T-Shirt',
        amount: 299.99,
        date: DateTime.now()),
    Transaction(
      id: '2',
      title: 'Shoes',
      amount: 699.99,
      date: DateTime.now()),
    Transaction(
      id: '3',
      title: 'Jeans',
      amount: 1299.99,
      date: DateTime.now()),
  ];
}