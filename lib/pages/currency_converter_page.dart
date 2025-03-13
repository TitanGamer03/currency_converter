import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget{
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {

  final TextEditingController _amountController = TextEditingController();
  double amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '0 \$',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              width: 300,
              child: TextField(
                controller: _amountController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.currency_rupee,
                  ),
                  hintText: "Enter Amount in INR",
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.lightBlue,
                      width: 2,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            const SizedBox(height: 16,),

            ElevatedButton(
              onPressed: (){
                setState(() {
                  amount = double.parse(_amountController.text);
                  amount = amount * 0.012;
                });
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.lightBlue),
              ),
              child: const Text(
                "Convert",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}