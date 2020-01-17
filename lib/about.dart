import 'package:flutter/material.dart';

class About extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.cyan,
            leading: Icon(Icons.add_location),
            title: Text('-: About :-')),
        body: Center(
          child: Container(
            color: Colors.white,
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image.asset("assets/images/fanart.jpg"),
                  Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Aplikasi SiMeal merupakan aplikasi yang digunakan sebagai pengganti list menu makanan di restoran/rumah makan.',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      )),
                  Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Online Study Group Eudeka!\nSalah satu program dari Eudeka! untuk belajar secara full online via Whatsapp/Telegram dan Google Classroom, dengan para praktisi handal di bidangnya. Selain itu juga kamu dapat berkesempatan untuk memperluas koneksimu dengan peserta lain.',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      )),
                  Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'OSG08 - Flutter Basic \nDengan jangka waktu lebih kurang 2 bulan, peserta diharapkan dapat mengenal dan membuat aplikasi simple Flutter dengan menggunakan data dari internet (API).',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      )),
                  Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Kelompok 3 Beranggotakan \n 1. Fahriz Dimasqy (Ketua)\n 2. Tomy Dwi\n 3. Muhammad Ichwandar\n 4. Indra Purnama',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
