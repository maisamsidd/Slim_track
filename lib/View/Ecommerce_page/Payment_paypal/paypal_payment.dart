import 'package:flutter/material.dart';


class PaypalPayment extends StatefulWidget {
  final String title;
   const PaypalPayment({super.key, required this.title});

  @override
  State<PaypalPayment> createState() => _PaypalPaymentState();
}

class _PaypalPaymentState extends State<PaypalPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: TextButton(
              onPressed: () => {
                    
                  },
              child: const Text("Make Payment")),
        ));
  }
}