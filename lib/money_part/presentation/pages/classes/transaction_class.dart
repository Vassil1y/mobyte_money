class TransactionClass {
  bool transactionType;
  bool transactionStatus;
  String date;
  String category;
  int amount;
  String description;

  TransactionClass(
      {this.transactionType = true,
      this.transactionStatus = true,
      this.date = "",
      this.category = "",
      this.amount = 0,
      this.description = ""});
}
