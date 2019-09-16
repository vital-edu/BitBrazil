import 'package:bit_brazil/models/order.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    Key key,
    @required this.order,
    @required this.color,
  }) : super(key: key);

  final Order order;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                order.price.toStringAsFixed(2),
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                order.amount.toStringAsFixed(8),
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
