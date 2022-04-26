class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});

  static List<Transaction> SeedArray() {
    return [
      Transaction(
          id: "t1", title: "C2 khappa", amount: 450, date: DateTime.now()),
      Transaction(
          id: "t2",
          title: "Cheezious pizza",
          amount: 640,
          date: DateTime.now().subtract(Duration(days: 6))),
      Transaction(
          id: "t3",
          title: "Vending",
          amount: 120,
          date: DateTime.now().subtract(Duration(days: 7))),
      Transaction(
          id: "t3",
          title: "Chai",
          amount: 100,
          date: DateTime.now().subtract(Duration(days: 5))),
      Transaction(
          id: "t3",
          title: "Donunts from go with flow",
          amount: 500,
          date: DateTime.now().subtract(Duration(days: 2))),
      Transaction(
          id: "t3",
          title: "some khappas",
          amount: 1500,
          date: DateTime.now().subtract(Duration(days: 1))),
      Transaction(
          id: "t3",
          title: "Random bill",
          amount: 900,
          date: DateTime.now().subtract(Duration(days: 3))),
      Transaction(
          id: "t3",
          title: "bowling at mega zone",
          amount: 1100,
          date: DateTime.now().subtract(Duration(days: 4))),
    ];
  }
}
