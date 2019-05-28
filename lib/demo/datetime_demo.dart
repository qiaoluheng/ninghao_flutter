import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
   DateTime selectedDate = DateTime.now();
   TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);


  Future<void> _selectDate() async {
    final DateTime date = await showDatePicker( 
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2020),
    );

    if(date == null){
      return;
    }else{
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> _selectedTime() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if(time == null) return;
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 添加日历选择器
                InkWell(
                  onTap: _selectDate,
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMd().format(selectedDate)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                // 添加时间选择器
                InkWell(
                  onTap: _selectedTime,
                  child: Row(
                    children: <Widget>[
                      Text(selectedTime.format(context)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}