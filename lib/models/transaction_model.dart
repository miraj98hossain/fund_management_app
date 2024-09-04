class Transaction {
  final String accountNumber;
  final num amount;
  final DateTime date;
  final String type;
  Transaction(
      {required this.accountNumber,
      required this.amount,
      required this.date,
      required this.type});
}
