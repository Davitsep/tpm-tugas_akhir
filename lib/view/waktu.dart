import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'dart:async';

class Dateandtime extends StatefulWidget {
  const Dateandtime({Key? key}) : super(key: key);

  @override
  State<Dateandtime> createState() => _DateandtimeState();
}

class _DateandtimeState extends State<Dateandtime> {
  late DateTime datetime;
  late Timer timer;
  late String selectedTime;

  @override
  void initState() {
    super.initState();
    datetime = DateTime.now();
    selectedTime = formatDate(datetime);
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        datetime = datetime.add(const Duration(seconds: 1));
        selectedTime = formatDate(datetime);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  String formatDate(DateTime dateTime) {
    return '${dateTime.year.toString()}/${dateTime.month.toString()}/${dateTime.day.toString()} : ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date and Time"),
        backgroundColor: Colors.white,
      ),
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
                    selectedTime,
                    style:
                        const TextStyle(fontSize: 30.0, fontFamily: 'Alkatra'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                tz.initializeTimeZones();
                setState(() {
                  var jakarta = tz.getLocation('Asia/Jakarta');
                  datetime = tz.TZDateTime.now(jakarta);
                  selectedTime = formatDate(datetime);
                });
              },
              child: const Text("WIB"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                tz.initializeTimeZones();
                setState(() {
                  var makassar = tz.getLocation('Asia/Makassar');
                  datetime = tz.TZDateTime.now(makassar);
                  selectedTime = formatDate(datetime);
                });
              },
              child: const Text("WITA"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                tz.initializeTimeZones();
                setState(() {
                  var jayapura = tz.getLocation('Asia/Jayapura');
                  datetime = tz.TZDateTime.now(jayapura);
                  selectedTime = formatDate(datetime);
                });
              },
              child: const Text("WIT"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                tz.initializeTimeZones();
                setState(() {
                  var london = tz.getLocation('Europe/London');
                  datetime = tz.TZDateTime.now(london);
                  selectedTime = formatDate(datetime);
                });
              },
              child: const Text("London"),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Date and Time',
    home: Dateandtime(),
  ));
}
