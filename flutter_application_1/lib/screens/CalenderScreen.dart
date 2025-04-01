import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Buttons.dart';
import 'package:flutter_application_1/screens/Show_labs.dart';
import 'package:flutter_application_1/screens/attendance_button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_application_1/screens/attendance.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now(); // Current focused day
  final List<DateTime> _selectedDays = [];
  late int _currentMonth;
  late int _currentYear;
  late PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose(); // Dispose it properly when done
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _currentMonth = _focusedDay.month; // Initialize with current month
    _currentYear = _focusedDay.year; // Initialize with current year
    _pageController = PageController();
  }

  void _updateMonthAndYear(DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
      _currentMonth = focusedDay.month;
      _currentYear = focusedDay.year;
    });
  }

  void _showMonthPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Column(
            children: List.generate(12, (index) {
              return ListTile(
                title: Text(_monthName(index + 1)),
                onTap: () {
                  setState(() {
                    _focusedDay =
                        DateTime(_focusedDay.year, index + 1, _focusedDay.day);
                    if (_focusedDay.month != _currentMonth) {
                      _focusedDay = DateTime(_focusedDay.year, index + 1, 1);
                    }
                    _currentMonth = index + 1;
                  });
                  Navigator.pop(context); // Close the bottom sheet
                },
              );
            }),
          ),
        );
      },
    );
  }

  void _showYearPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Column(
            children: List.generate(51, (index) {
              int year = _currentYear - 25 + index;
              return ListTile(
                title: Text('$year'),
                onTap: () {
                  setState(() {
                    _focusedDay =
                        DateTime(year, _focusedDay.month, _focusedDay.day);
                    if (_focusedDay.month != _currentMonth) {
                      _focusedDay = DateTime(year, _focusedDay.month, 1);
                    }
                    _currentYear = year;
                  });
                  Navigator.pop(context); // Close the bottom sheet
                },
              );
            }),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable the back arrow
        backgroundColor: const Color(0xffffe2e3),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _showYearPicker, // Show the year picker
              child: Text('$_currentYear ',
                  style: const TextStyle(
                      color: Color.fromARGB(221, 0, 0, 0), fontSize: 20)),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: _showMonthPicker, // Show the month picker
              child: Text(
                '${_monthName(_currentMonth)} ',
                style: const TextStyle(
                    color: Color.fromARGB(221, 0, 0, 0), fontSize: 20),
              ),
            ),
          ],
        ),
      ),

      // appBar: AppBar(
      //   title: GestureDetector(
      //     onTap: _showMonthPicker, // Opens the month picker
      //     child: Text(' $_currentYear | ${_monthName(_currentMonth)} '),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Color(0xffffe2e3),
      //   actions: [
      //     GestureDetector(
      //       onTap: _showYearPicker, // Opens the year picker
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Icon(Icons.arrow_drop_down),
      //       ),
      //     ),
      //   ],
      // ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFE3E3), Color(0xFFCEA2F4)],
          ),
        ),
        child: Column(
          children: [
            // const SizedBox(height: 50),
            // // Year and Month Selector
            // Center(
            //   child: Column(
            //     children: const [
            //       Text(
            //         "> 2025",
            //         style: TextStyle(
            //             fontSize: 24,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white),
            //       ),
            //       Text(
            //         "< August >",
            //         style: TextStyle(
            //             fontSize: 24,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 20),
            // // Calendar
            TableCalendar(
              firstDay: DateTime.utc(1000, 1, 1),
              lastDay: DateTime.utc(3999, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => _selectedDays
                  .contains(day), // Check if the day is in the list
              onPageChanged: (focusedDay) {
                _updateMonthAndYear(focusedDay);
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                ),
                defaultDecoration: const BoxDecoration(
                  shape: BoxShape
                      .rectangle, // Add this to ensure defaults don't use circle
                ),
                weekendDecoration: const BoxDecoration(
                  shape: BoxShape.rectangle, // Add for weekends
                ),
                outsideDecoration: const BoxDecoration(
                  shape:
                      BoxShape.rectangle, // Add for dates outside current month
                ),
                rangeStartDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green, // Custom color for range start
                ),
                rangeEndDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green, // Custom color for range end
                ),
              ),

              headerVisible: false,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                  if (_selectedDays.contains(selectedDay)) {
                    // Deselect the day if it's already selected
                    _selectedDays.remove(selectedDay);
                  } else {
                    // Add the selected day to the list
                    _selectedDays.add(selectedDay);
                  }
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _focusedDay =
                          DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
                      _updateMonthAndYear(_focusedDay);
                    });
                  },
                  child: const Text('Previous Month'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _focusedDay =
                          DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
                      _updateMonthAndYear(_focusedDay);
                    });
                  },
                  child: const Text('Next Month'),
                ),
              ],
            ),

            const Spacer(),
            // Action Buttons
            const ActionButtons(),
            // Show Labs Button
            const Showattendance(),

            // AttendanceScreen(),
          ],
        ),
      ),
    );
  }
}

String _monthName(int month) {
  const monthNames = [
    '',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  return monthNames[month];
}
