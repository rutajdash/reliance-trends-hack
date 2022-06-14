class CounterModel {
  int id;
  String brandName;
  int totalCount;
  int currentCount;

  CounterModel({
    required this.id,
    required this.brandName,
    required this.totalCount,
    required this.currentCount,
  });

  double get emptyPercentage {
    return (currentCount / totalCount) * 100;
  }
}
