import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart' show debugPrint;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance Record',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AttendanceScreen(),
    );
  }
}

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  AttendanceScreenState createState() => AttendanceScreenState();
}

class AttendanceScreenState extends State<AttendanceScreen> {
  List<dynamic> attendanceList = [];
  late Timer _timer;
  bool isLoading = true;
  String errorMessage = '';

  Future<void> fetchAttendance() async {
    const String apiUrl = 'http://192.168.1.3:5000/api/attendance';
    try {
      debugPrint('Attempting to fetch data from: $apiUrl');
      final response = await http
          .get(Uri.parse(apiUrl))
          .timeout(const Duration(seconds: 10));

      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          attendanceList = json.decode(response.body);
          isLoading = false;
          errorMessage = '';
        });
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Server error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Connection error: $e';
      });
      debugPrint('Error details: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAttendance();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchAttendance();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Attendance Record')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : attendanceList.isEmpty
                  ? const Center(child: Text('No attendance data yet'))
                  : SingleChildScrollView(
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Time')),
                          DataColumn(label: Text('Date')),
                        ],
                        rows: attendanceList
                            .map((item) => DataRow(cells: [
                                  DataCell(Text(item['name'] ?? 'N/A')),
                                  DataCell(Text(item['time'] ?? 'N/A')),
                                  DataCell(Text(item['date'] ?? 'N/A')),
                                ]))
                            .toList(),
                      ),
                    ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Manual Refresh',
        onPressed: fetchAttendance,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
