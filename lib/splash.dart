import 'package:flutter/material.dart';
import 'home.dart';

class MySplash extends StatefulWidget {
  const MySplash({Key? key}) : super(key: key);

  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 10000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://calculator-online.net/assets/img/binary.webp'),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "SIMPLE \nCALCULATOR",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text("TangselBoyCopyRight",
                  style: TextStyle(fontSize: 13, color: Colors.white))
            ],
          ),
        ));
  }
}
