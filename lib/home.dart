import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dectobin.dart';
import 'bintodec.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DecToBin()));
              },
              child: const Text("Decimal To Binary",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: Colors.blueGrey,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BinToDec()));
              },
              child: const Text("Binary To Decimal",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
