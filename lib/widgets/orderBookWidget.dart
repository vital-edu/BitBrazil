import 'package:bit_brazil/models/order.dart';
import 'package:bit_brazil/services/api.dart';
import 'package:flutter/material.dart';

import 'orderWidget.dart';
import 'orderbookHeaderWidget.dart';

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
              OrderbookHeaderWidget(),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: orders.length,
                  itemBuilder: (BuildContext context, int index) {
                    OrderWidgetStyle orderStyle;
                    if (index < snap.data.asks.length - 1) {
                      orderStyle = OrderWidgetStyle.askOrder;
                    } else if (index == snap.data.asks.length - 1) {
                      orderStyle = OrderWidgetStyle.highlightedAskOrder;
                    } else if (index == snap.data.asks.length) {
                      orderStyle = OrderWidgetStyle.highlighteBidOrder;
                    } else {
                      orderStyle = OrderWidgetStyle.bidOrder;
                    }

                    return OrderWidget(
                      order: orders[index],
                      style: orderStyle,
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
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          );
        }
      },
      future: getOrderbook()
    );
  }
}
