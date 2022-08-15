

class TransactionClass {
  String title = "";
  bool transactionType;
  bool transactionStatus;
  String date;
  String category;
  int amount;
  String description;

  TransactionClass(
      {this.title = "",
      this.transactionType = true,
      this.transactionStatus = true,
      this.date = "",
      this.category = "",
      this.amount = 0,
      this.description = ""});

}
