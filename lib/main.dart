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
        backgroundColor: Color(0xff212427),
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
          return Column(
            children: <Widget>[
              OrderbookHeader(),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: orders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OrderWidget(
                      order: orders[index],
                      color: index < snap.data.asks.length ? Colors.red : Colors.blue,
                    );
                  },
                )
              )
            ],
          );
        } else {
          return Center(
            child: const Text(
              'Carregando dados...',
              style: TextStyle(fontSize: 32),
            ),
          );
        }
      },
      future: getOrderbook()
    );
  }
}

class OrderbookHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                'Preço (BRL)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xffc8c8c8)),
              ),
            ),
            Expanded(
              flex: 1,
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
        title: Text(
          order.price.toString(),
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
