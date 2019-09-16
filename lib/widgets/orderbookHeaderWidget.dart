
import 'package:flutter/material.dart';

class OrderbookHeaderWidget extends StatelessWidget {
  Expanded column(String text) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xffc8c8c8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Row(
          children: [
            column('Preço (BRL)'),
            column('Volume (BTC)'),
          ]
        ),
      ),
    );
  }
}
