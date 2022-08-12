

class Transaction {
  String title = "";
  bool transactionType;
  bool transactionStatus;
  DateTime? date;
  String category;
  int amount;
  String description;

  Transaction(
      {this.title = "",
      this.transactionType = true,
      this.transactionStatus = true,
      this.date,
      this.category = "",
      this.amount = 0,
      this.description = ""});

}
