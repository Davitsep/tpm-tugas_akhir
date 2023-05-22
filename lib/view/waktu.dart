import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'dart:async';

class Dateandtime extends StatefulWidget {
  const Dateandtime({super.key});

  @override
  State<Dateandtime> createState() => _DateandtimeState();
}

class _DateandtimeState extends State<Dateandtime> {
  DateTime datetime = DateTime(2021, 12, 24, 3, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Date and Time"), backgroundColor: Colors.white),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                  child: SizedBox(
                      height: 100.0,
                      child: Center(
                          child: Text(
                        '${datetime.year.toString()}/${datetime.month.toString()}/${datetime.day.toString()} : ${datetime.hour.toString()}:${datetime.minute.toString()}:${datetime.second.toString()}',
                        style: const TextStyle(
                            fontSize: 30.0, fontFamily: 'Alkatra'),
                      )))),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () async {
                    var date = await pickDate();
                    if (date == null) return;
                    setState(() {
                      datetime = date;
                    });
                  },
                  child: const Text("Change Date")),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () async {
                    var time = await pickTime();
                    if (time == null) return;
                    setState(() {
                      datetime = DateTime(
                        datetime.year,
                        datetime.month,
                        datetime.day,
                        time.hour,
                        time.minute,
                      );
                    });
                  },
                  child: const Text("Change Time")),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    tz.initializeTimeZones();
                    setState(() {
                      var jakarta = tz.getLocation('Asia/Jakarta');
                      datetime = tz.TZDateTime.now(jakarta);
                    });
                  },
                  child: const Text("WIB")),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    tz.initializeTimeZones();
                    setState(() {
                      var makassar = tz.getLocation('Asia/Makassar');
                      datetime = tz.TZDateTime.now(makassar);
                    });
                  },
                  child: const Text("WITA")),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    tz.initializeTimeZones();
                    setState(() {
                      var jayapura = tz.getLocation('Asia/Jayapura');

                      datetime = tz.TZDateTime.now(jayapura);
                    });
                  },
                  child: const Text("WIT")),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    tz.initializeTimeZones();
                    setState(() {
                      var london = tz.getLocation('Europe/London');

                      datetime = tz.TZDateTime.now(london);
                    });
                  },
                  child: const Text("London")),
            ],
          )),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: datetime,
      firstDate: DateTime(1990),
      lastDate: DateTime(2030));

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: datetime.hour, minute: datetime.minute));
}
