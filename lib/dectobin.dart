import 'package:flutter/material.dart';

class DecToBin extends StatefulWidget {
  const DecToBin({Key? key}) : super(key: key);

  @override
  _DecToBinState createState() => _DecToBinState();
}

class _DecToBinState extends State<DecToBin> {
  String result = "";
  int decimal = 0;
  int temp = 0;
  TextEditingController calculated = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String calculatedDecimal(int decimal) {
    String value = "";
    while (decimal > 0) {
      temp = decimal % 2;
      value = temp.toString() + value;
      temp = (decimal / 2).floor();
      decimal = temp;
    }
    return value;
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
                const Text("Enter Decimal Number",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70))),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                        initialValue: "0",
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Decimal number cannot be empty";
                          }
                          decimal = int.parse(value.toString());
                        },
                        onChanged: (val) {
                          if (_formKey.currentState!.validate()) {
                            result = calculatedDecimal(decimal);
                            calculated.text = result;
                          }
                        })),
                const Text("Binary Number",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70))),
                    style: const TextStyle(fontSize: 18, color: Colors.white),
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
