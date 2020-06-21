import 'package:flutter/material.dart';
import 'package:nepali_calender/nepali_date_picker.dart';
import 'package:nepali_calender/src/material/calendar_date_picker.dart' as cdp;
import 'package:nepali_utils/nepali_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NepaliCalender(),
    );
  }
}

class NepaliCalender extends StatefulWidget {
  @override
  _NepaliCalenderState createState() => _NepaliCalenderState();
}

class _NepaliCalenderState extends State<NepaliCalender> {
  NepaliDateTime _selectedDate = NepaliDateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calender'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              cdp.CalendarDatePicker(
                initialDate: NepaliDateTime.now(),
                firstDate: NepaliDateTime(2000),
                lastDate: NepaliDateTime(2099, 11, 6),
                currentDate: NepaliDateTime(2077, 3, 19),
                onDateChanged: _handleDateChanged,
                initialCalendarMode: DatePickerMode.day,
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  weekendStyle: TextStyle().copyWith(color: Colors.red[800]),
                  holidayStyle: TextStyle().copyWith(color: Colors.green[800]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleDateChanged(NepaliDateTime date) {
    setState(() => _selectedDate = date);
  }
}
