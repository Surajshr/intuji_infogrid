class LinearChartDataEntity {
  final String title;
  final String value;
  final String percentage;
  final List<double> dataPoints;
  final String valueAmount;

  LinearChartDataEntity({
    required this.title,
    required this.value,
    required this.percentage,
    required this.dataPoints,
    required this.valueAmount,
  });
}
