import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget{
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {

  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  double amount = 0;
  String formattedNumber = '0';
  String input = '';

  void convertCurrency() {
    if (kDebugMode) {
      print("${_fromController.text}, ${_toController.text}");
    }
    setState(() {
      input = "";
      if (_fromController.text.isEmpty) {
        _fromController.text = "0";
      }
      amount = double.parse(_fromController.text) * 86.96;
      String formattedNumber = amount.toStringAsFixed(5);
      amount = double.parse(formattedNumber);
      input = '$amount ₹';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // TextBox for input amount.
            SizedBox(
              width: 300,
              child: TextField(
                controller: _fromController,
                decoration: InputDecoration(
                  labelText: "Amount in USD",
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.lightBlue,
                      width: 2,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            // const SizedBox(height: 16,),
            //
            // TextBox for output amount.
            // SizedBox(
            //   width: 300,
            //   child: TextField(
            //     controller: _toController,
            //     decoration: InputDecoration(
            //       hintText: "Amount in USD",
            //       filled: true,
            //       fillColor: Colors.white,
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(
            //           color: Colors.black,
            //           width: 2,
            //         ),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(
            //           color: Colors.lightBlue,
            //           width: 2,
            //         ),
            //       ),
            //     ),
            //     keyboardType: TextInputType.number,
            //   ),
            // ),

            const SizedBox(height: 16,),

            // Button to convert currency.
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: convertCurrency,
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(10),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                ),
                child: const Text(
                  "Convert",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16,),

            // Show Converted amount.
            SizedBox(
              width: 300,
              child: Center(
                child: Text(
                  input,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}