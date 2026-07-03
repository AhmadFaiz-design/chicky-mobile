import 'package:chicky/models/fcr_model.dart';
import 'package:chicky/models/input_rusak_model.dart';

class FCRController {

  List<String> getValidation({required wrongInputModel validationResult}){
    List<String> listWrongInput = [];

    if(validationResult.pakan != null){
      listWrongInput.add("Jumlah Pakan");
    }
    if(validationResult.amonia != null){
      listWrongInput.add("Gas Amonia");
    }
    if(validationResult.suhu != null){
      listWrongInput.add("Suhu");
    }
    if(validationResult.kelembaban != null){
      listWrongInput.add("Kelembaban");
    }
    if(validationResult.cahaya != null){
      listWrongInput.add("Intensitas Cahaya");
    }
    if(validationResult.bising != null){
      listWrongInput.add("Kebisingan Kandang");
    }

    return listWrongInput;
  }

  wrongInputModel validationCheck({
    required FCRModel inputData,
    required wrongInputModel wrongInput,
  }) {
    if (inputData.ayam <= 10) {
      if (inputData.pakan < 0.9) {
        wrongInput.pakan = inputData.pakan;
      }
    }
    if (inputData.ayam > 10) {
      if (inputData.pakan < 1.2) {
        wrongInput.pakan = inputData.pakan;
      }
    }
    if (inputData.amonia < 0.0 || inputData.amonia > 30.0) {
      wrongInput.amonia = inputData.amonia;
    }
    if (inputData.suhu < 15.0 || inputData.suhu > 40.0) {
      wrongInput.suhu = inputData.suhu;
    }
    if (inputData.kelembaban < 40.0 || inputData.kelembaban > 90.0) {
      wrongInput.kelembaban = inputData.kelembaban;
    }
    if (inputData.cahaya < 0.0 || inputData.cahaya > 50.0) {
      wrongInput.cahaya = inputData.cahaya;
    }
    if (inputData.bising < 30.0 || inputData.bising > 90.0) {
      wrongInput.bising = inputData.bising;
    }
    return wrongInput;
  }

  List<double> calculatedFCR({
    required FCRModel inputData,
  }) {
    const double intercept = -2.5;
    const double wChicken = 0.60; // Menurunkan efisiensi jika terlalu padat
    const double wFeeding = 2.0; // Pengaruh pakan masuk berlebih
    const double wAmmonia = -0.20; // Pengaruh negatif korelasi amonia
    const double wTemp = -0.10; // Pengaruh suhu optimal
    const double wHumidity = 0.05; // Pengaruh kelembaban tinggi
    const double wLight = 0.20; // Pengaruh intensitas cahaya
    const double wNoise = -0.05; // Faktor stres akibat kebisingan

    double eggProductionResult =
        intercept +
        (wChicken * inputData.ayam) +
        (wFeeding * inputData.pakan) +
        (wAmmonia * inputData.amonia) +
        (wTemp * inputData.suhu) +
        (wHumidity * inputData.kelembaban) +
        (wLight * inputData.cahaya) +
        (wNoise * inputData.bising);

    // Mencegah hasil minus jika ayam stres berat
    if (eggProductionResult < 0) return [0.0, 0.0];

    print('Jumlah prediksi telur: $eggProductionResult');

    // Rata-rata berat 1 butir telur ayam ras adalah 60 gram (0.06 Kg)
    double eggWeight = eggProductionResult * 0.06;
    double rawresultFCR = inputData.pakan / eggWeight;
    List<double> resultFCR = [eggProductionResult, rawresultFCR];

    print('Total Berat Telur:  $eggWeight');
    print('Hasil FCR:  $rawresultFCR');

    return resultFCR;
  }
}
