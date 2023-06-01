import 'package:flutter/material.dart';
import '../shared_preferences_service.dart';

SharedPreferencesService sharedPreferencesService = SharedPreferencesService();

class KesanPage extends StatelessWidget {
  const KesanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Pesan dan Kesan',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Sans-Serif',
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
            child: ListView(
          padding: EdgeInsets.all(30),
          children: [
            Text(
              'Pesan dan Kesan untuk pembelajaran mata kuliah TPM',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              'Pesan :',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              'Semoga kita semua selalu diberikan kemudahan, kelancaran, kesehatan serta umur yang panjang, Aamiin...',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 15),
            Text(
              'Kesan :',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              'Pembelajaran satu semester yang cukup menyenangkan, materi yang disampaikan sangat jelas walaupun susah di ingat saking banyaknya. Terima kasih pak Bagus',
              textAlign: TextAlign.justify,
            ),
          ],
        )));
  }
}
