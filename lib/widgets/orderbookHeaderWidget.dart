
import 'package:flutter/material.dart';

class OrderbookHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Preço (BRL)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xffc8c8c8)),
              ),
            ),
            Expanded(
              child: Text(
                'Volume (BTC)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xffc8c8c8)),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
