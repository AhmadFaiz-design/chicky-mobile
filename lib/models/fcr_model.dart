class FCRModel {
  final double ayam;
  final double pakan;
  final double amonia;
  final double suhu;
  final double kelembaban;
  final double cahaya;
  final double bising;
  double? hasilFCR;

  FCRModel({
    required this.ayam,
    required this.pakan,
    required this.amonia,
    required this.suhu,
    required this.kelembaban,
    required this.cahaya,
    required this.bising,
    this.hasilFCR
  });
}
