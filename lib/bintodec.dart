import 'package:flutter/material.dart';
import 'dart:math';

class BinToDec extends StatefulWidget {
  const BinToDec({Key? key}) : super(key: key);

  @override
  _BinToDecState createState() => _BinToDecState();
}

class _BinToDecState extends State<BinToDec> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController calculated = TextEditingController();
  String binary = "";
  String result = "";

  int calculatedBinary(String binary) {
    int sum = 0;
    num two = 2;
    for (int i = 0; i < binary.length; i++) {
      sum += (int.parse(binary[i]) * pow(two, binary.length - (i + 1)).toInt());
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.7),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Enter Binary Number",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70))),
                        initialValue: "0",
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Binary number cannot be empty";
                          } else if (value != null &&
                              value.toString().contains(RegExp(r'[2-9]'))) {
                            return "Binary number is not valid";
                          }
                          binary = value.toString();
                        },
                        onChanged: (val) {
                          if (_formKey.currentState!.validate()) {
                            result = calculatedBinary(binary).toString();
                            calculated.text = result;
                          }
                        })),
                const Text("Decimal Number",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70))),
                    readOnly: true,
                    controller: calculated,
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.blueGrey,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
