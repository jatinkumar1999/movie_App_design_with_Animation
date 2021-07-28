import 'package:flutter/material.dart';

class BuyButton extends StatefulWidget {
  BuyButton({Key key}) : super(key: key);

  @override
  _BuyButtonState createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.green,
        ),
      ),
      child: const Text(
        "Buy Ticket",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
