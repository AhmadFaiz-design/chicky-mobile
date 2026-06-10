import 'package:chicky/core/colours.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FcrDesemberChart extends StatelessWidget {
  const FcrDesemberChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colours.gray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- 1. Bagian Header ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Grafik FCR Desember',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Row(
                    children: [
                      const Text(
                        '1,2 Kg',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Badge "up to 5%"
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colours.red),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_upward, color: Colours.red, size: 16),
                            const SizedBox(width: 2),
                            const Text(
                              'up to 5%',
                              style: TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Tombol Dropdown "Mingguan"
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.deepOrange.shade600,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Mingguan',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 12),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // --- 2. Bagian Inti Grafik ---
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                // Mematikan garis grid tengah agar persis seperti gambar
                gridData: const FlGridData(show: false),
                
                // Mengatur Sumbu X dan Y
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  
                  // Sumbu Y (FCR)
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 0.2, // Jarak antar angka (0.8, 1.0, 1.2, 1.4)
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        // Hanya cetak angka yang sesuai desain
                        if (value == 0.8 || value == 1.0 || value == 1.2 || value == 1.4) {
                          // Ubah format titik ke koma (misal 1.2 jadi 1,2)
                          String text = value.toStringAsFixed(1).replaceAll('.', ',');
                          if (value == 1.0) text = '1'; // Khusus angka 1 tidak usah pakai koma
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(text, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  
                  // Sumbu X (Tanggal 14 - 20)
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1, // Jarak tiap 1 hari
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 10,
                          child: Text(value.toInt().toString(), style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        );
                      },
                    ),
                  ),
                ),
                
                // Menampilkan garis sumbu hanya di kiri dan bawah
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade400, width: 1.5),
                    left: BorderSide(color: Colors.grey.shade400, width: 1.5),
                    right: BorderSide.none,
                    top: BorderSide.none,
                  ),
                ),
                
                // Batas minimal dan maksimal grafik
                minX: 13.5, // Diberi sedikit jarak awal agar titik tidak terpotong
                maxX: 20.5,
                minY: 0.6,
                maxY: 1.5,
                
                // Data Garis dan Titik
                lineBarsData: [
                  LineChartBarData(
                    // Koordinat X (hari) dan Y (FCR)
                    spots: const [
                      FlSpot(14, 0.8),
                      FlSpot(15, 0.85),
                      FlSpot(16, 0.88),
                      FlSpot(17, 1.0),
                      FlSpot(18, 1.08),
                      FlSpot(19, 1.2),
                      FlSpot(20, 1.23),
                    ],
                    isCurved: false, // Garis lurus patah-patah, bukan melengkung halus
                    color: Colors.black, // Warna garis hitam
                    barWidth: 2,
                    isStrokeCapRound: true,
                    // Format titik (dot)
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 5,
                          color: Colors.deepOrange.shade500, // Titik warna oranye
                          strokeWidth: 0, // Tanpa border putih
                        );
                      },
                    ),
                    belowBarData: BarAreaData(show: false), // Tanpa warna gradien di bawah garis
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