import 'package:bit_brazil/widgets/orderBookWidget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

main() => runApp(HomeWidget());

class HomeWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bit Brazil'),
        ),
        backgroundColor: Color(0xff212427),
        body: new OrderbookWidget()
      )
    );
  }
}
