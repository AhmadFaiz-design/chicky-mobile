class FCRModel {
  int? id;
  double? hasilFCR;
  final double ayam;
  final double pakan;
  final double amonia;
  final double suhu;
  final double kelembaban;
  final double cahaya;
  final double bising;

  FCRModel({
    this.id,
    this.hasilFCR,
    required this.ayam,
    required this.pakan,
    required this.amonia,
    required this.suhu,
    required this.kelembaban,
    required this.cahaya,
    required this.bising,
  });
}

class wrongInputModel {
  int? id;
  double? ayam;
  double? pakan;
  double? amonia;
  double? suhu;
  double? kelembaban;
  double? cahaya;
  double? bising;

  wrongInputModel({
    this.id,
    this.ayam,
    this.pakan,
    this.amonia,
    this.suhu,
    this.kelembaban,
    this.cahaya,
    this.bising,
  });

  @override
  String toString() {
    return 'wrongInputModel("pakan: $pakan", "suhu: $suhu", "kelembaban: $kelembaban", "amonia: $amonia", "cahaya: $cahaya", "bising: $bising")';
  }
}
