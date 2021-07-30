class Budget {

  final String title;
  String totalPayee;
  String totalAmount;

  Budget({required this.title, this.totalPayee = "0", this.totalAmount = "0"});

  void setPayee(String payee) {
    this.totalPayee = payee;
  }

}