import 'package:chicky/models/fcr_model.dart';

class FCRController {

  double calculatedFCR(FCRModel inputData){
    const double intercept = -1.6231;
    const double wChicken = 1.14;   // Menurunkan efisiensi jika terlalu padat
    const double wFeeding = 1.23;   // Pengaruh pakan masuk berlebih
    const double wAmmonia = -1.05;  // Pengaruh negatif korelasi amonia
    const double wTemp = -0.62;     // Pengaruh suhu optimal
    const double wHumidity = 1.02;  // Pengaruh kelembaban tinggi
    const double wLight = -0.26;    // Pengaruh intensitas cahaya
    const double wNoise = 0.57;     // Faktor stres akibat kebisingan

    double FCRResult = intercept
    + (wChicken * inputData.ayam)
    + (wFeeding + inputData.pakan)
    + (wAmmonia + inputData.amonia)
    + (wTemp + inputData.suhu)
    + (wHumidity + inputData.kelembaban)
    + (wLight + inputData.cahaya)
    + (wNoise + inputData.bising);

    if (FCRResult < 0.0){
      FCRResult = 0.0;
    }

    inputData.hasilFCR = FCRResult;

    return FCRResult;
  }
}