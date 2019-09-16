import 'package:bit_brazil/services/api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'models/order.dart';

main() => runApp(HomeWidget());

class HomeWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bit Brazil'),
        ),
        body: new OrderbookWidget()
      )
    );
  }
}

class OrderbookWidget extends StatelessWidget {
  const OrderbookWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          List<Order> orders = snap.data.asks + snap.data.bids;
          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: orders.length,
            itemBuilder: (BuildContext context, int index) {
                return OrderWidget(
                  order: orders[index],
                  color: index < snap.data.asks.length ? Colors.red : Colors.blue,
                );
            },
          );
        } else {
          return Center(
            child: const Text(
              'Loading data...',
              style: TextStyle(fontSize: 32),
            ),
          );
        }
      },
      future: getOrderbook()
    );
  }
}

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
      // color: Colors.red,
      child: ListTile(
        title: Text(
          order.price.toString(),
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
