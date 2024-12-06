import 'package:flutter/material.dart';

class MonitoringPage extends StatefulWidget {
  @override
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  final TextEditingController _searchController = TextEditingController();

  final Color primaryBlue = Color(0xFF144795);

  final List<Map<String, dynamic>> attendanceList = [
    {
      'tanggal': '20 Maret 2024',
      'waktu': '08:00',
      'status': 'Hadir',
      'warna': Colors.white
    },
    {
      'tanggal': '19 Maret 2024',
      'waktu': '08:30',
      'status': 'Terlambat',
      'warna': Colors.blue.shade900
    },
    {
      'tanggal': '18 Maret 2024',
      'waktu': '00:00',
      'status': 'Sakit',
      'warna': Colors.white
    },
    {
      'tanggal': '17 Maret 2024',
      'waktu': '08:05',
      'status': 'Hadir',
      'warna': Colors.blue.shade900
    },
    {
      'tanggal': '16 Maret 2024',
      'waktu': '08:45',
      'status': 'Terlambat',
      'warna': Colors.white
    },
    {
      'tanggal': '15 Maret 2024',
      'waktu': '08:00',
      'status': 'Hadir',
      'warna': Colors.blue.shade900
    },
    {
      'tanggal': '14 Maret 2024',
      'waktu': '08:00',
      'status': 'Hadir',
      'warna': Colors.white
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoring'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  hintText: 'Cari berdasarkan tanggal...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  filled: true,
                  fillColor: Colors.black12),
            ),
            SizedBox(height: 20),

            // List Absensi
            Expanded(
              child: ListView.builder(
                itemCount: attendanceList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: attendanceList[index]['warna'],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          // Tanggal
                          Expanded(
                            flex: 2,
                            child: Text(
                              attendanceList[index]['tanggal'],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          // Waktu
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                attendanceList[index]['waktu'],
                              ),
                            ),
                          ),
                          // Status
                          Container(
                            width: 80,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: _getStatusColor(
                                  attendanceList[index]['status'] ?? 'Hadir'),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              attendanceList[index]['status'] ?? 'Hadir',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Hadir':
        return Color(0xFF8FF3AD);
      case 'Terlambat':
        return Color(0xFFFECA3E);
      case 'Sakit':
        return Color(0xFFF14642);
      case 'Izin':
        return Color(0xFF83C7FF);
      default:
        return Color(0xFF8FF3AD); // Default Hadir
    }
  }
}
