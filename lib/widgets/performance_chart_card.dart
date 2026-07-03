import 'dart:math'; // Wajib untuk fungsi perhitungan max dan min
import 'package:chicky/core/colours.dart';
import 'package:chicky/core/icons.dart';
import 'package:chicky/models/fcrHistory_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FcrChart extends StatelessWidget {
  final List<FcrHistoryModel> listRecentFCR;
  FcrChart({required this.listRecentFCR});

  @override
  Widget build(BuildContext context) {
    // 1. Balik urutan data agar kronologis dari kiri (lama) ke kanan (terbaru)
    List<FcrHistoryModel> sortedData = listRecentFCR.reversed.toList();

    // 2. Generate titik koordinat (Spots) secara dinamis
    List<FlSpot> fcrSpots = [];
    for (int i = 0; i < sortedData.length; i++) {
      double fcrValue = sortedData[i].fcr.hasilFCR ?? 0.0;
      fcrSpots.add(FlSpot(i.toDouble(), fcrValue));
    }

    // 3. Logika Auto-Scale Batas Atas & Bawah Grafik
    double maxFCR = 1.6;
    double minFCR = 0.0;

    if (sortedData.isNotEmpty) {
      maxFCR = sortedData.map((e) => e.fcr.hasilFCR ?? 0.0).reduce(max);
      minFCR = sortedData.map((e) => e.fcr.hasilFCR ?? 0.0).reduce(min);
    }

    // Berikan ruang napas (padding) agar titik tertinggi tidak mentok ke atap UI
    double chartMaxY = maxFCR + 0.4;
    double chartMinY = 0.0;

    // --- TAMBAHAN BARU: Logika Auto-Interval ---
    // Cari tahu seberapa jauh jarak dari lantai ke plafon grafik
    double rentangY = chartMaxY - chartMinY;

    // KUNCI MUTLAK UNTUK SIZEDBOX 100px:
    // Rentang Y kita bagi 2 saja, sehingga hanya akan muncul 3 angka (Bawah, Tengah, Atas)
    double intervalY = rentangY / 2; 

    // Pengaman: Jika datanya cuma 1 atau rentangnya 0, jangan sampai error dibagi nol
    if (intervalY <= 0) {
      intervalY = 1.0;
    }

    // 4. Ambil teks FCR terakhir untuk Header
    String latestFcrText =
        listRecentFCR.isNotEmpty
            ? '${listRecentFCR.first.fcr.hasilFCR!.toStringAsFixed(2).replaceAll('.', ',')} Kg'
            : '0,00 Kg';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colours.gray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // --- HEADER GRAFIK ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                IconsSVG.chart,
                colorFilter: ColorFilter.mode(
                  Colours.mainOrange,
                  BlendMode.srcIn,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Grafik Performa FCR',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    latestFcrText, // Angka FCR selalu real-time
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // --- INTI GRAFIK ---
          SizedBox(
            height: 150,
            child:
                fcrSpots.isEmpty
                    ? const Center(
                      child: Text(
                        "Belum ada data grafik",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                    : LineChart(
                      LineChartData(
                        // KUNCI PENGAMAN: Potong garis yang keluar dari batas kotak
                        clipData: const FlClipData.all(),

                        gridData: const FlGridData(show: false),
                        lineTouchData: LineTouchData(
                          handleBuiltInTouches: true,
                          touchTooltipData: LineTouchTooltipData(
                            // 1. Mengubah background pop-up menjadi warna Oranye
                            getTooltipColor:
                                (touchedSpot) => Colours.mainOrange,

                            fitInsideHorizontally: true,
                            fitInsideVertically: true,

                            // 2. Mengatur isi teks dan warnanya
                            getTooltipItems: (List<LineBarSpot> touchedSpots) {
                              return touchedSpots.map((
                                LineBarSpot touchedSpot,
                              ) {
                                // Memotong desimal jadi 2 angka dan ubah titik jadi koma
                                String formattedValue = touchedSpot.y
                                    .toStringAsFixed(2)
                                    .replaceAll('.', ',');

                                return LineTooltipItem(
                                  '$formattedValue Kg', // Tambahkan satuan Kg agar mantap
                                  const TextStyle(
                                    color: Colors.white, // Teks warna putih
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                );
                              }).toList();
                            },
                          ),
                        ),

                        // Mengatur Label Sumbu
                        titlesData: FlTitlesData(
                          show: true,
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),

                          // Sumbu X dimatikan total
                          bottomTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),

                          // Sumbu Y (Kiri) tetap menyala dengan format desimal koma
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: intervalY,
                              reservedSize: 20,
                              getTitlesWidget: (value, meta) {

                              //   if (value == 0.0) {
                              //   return const SizedBox.shrink(); 
                              // }
                                String text = value
                                    .toStringAsFixed(1)
                                    .replaceAll('.', ',');
                                if (value == 1.0) text = '1';

                                return SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  space: 0,
                                  child: Text(
                                    text,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        // Mengatur Garis Border (Hanya kiri)
                        borderData: FlBorderData(
                          show: false,
                          border: Border(
                            left: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1.5,
                            ),
                            bottom: BorderSide.none,
                            right: BorderSide.none,
                            top: BorderSide.none,
                          ),
                        ),

                        // --- UBAH BAGIAN INI ---
                        // Beri nilai minus (misal -0.3) agar garis Y-axis mundur sedikit ke kiri
                        // sehingga titik pertama (di x = 0) punya ruang untuk digambar utuh.
                        minX: -0.3,

                        // Tambahkan +0.3 di ujung batas kanan agar titik terakhir tidak kepotong
                        maxX:
                            fcrSpots.length > 1
                                ? (fcrSpots.length - 1).toDouble() + 0.3
                                : 1.3,

                        minY: chartMinY,
                        maxY: chartMaxY,

                        // Styling Garis & Titik
                        lineBarsData: [
                          LineChartBarData(
                            spots: fcrSpots,
                            isCurved: false,
                            color: Colors.black,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: FlDotData(
                              show: true,
                              getDotPainter: (spot, percent, barData, index) {
                                return FlDotCirclePainter(
                                  radius: 4,
                                  color:
                                      Colours
                                          .mainOrange, // Warna titik ChickLog
                                  strokeWidth: 0,
                                );
                              },
                            ),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
