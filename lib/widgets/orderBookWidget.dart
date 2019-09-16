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
          List<Order> asks = snap.data.asks;
          List<Order> bids = snap.data.bids;
          double ask = asks.last.price.toDouble();
          double bid = bids.last.price.toDouble();
          double spread = ask - bid;

          return Column(
            children: <Widget>[
              OrderbookHeaderWidget(),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: asks.length,
                  itemBuilder: (BuildContext context, int index) {
                    OrderWidgetStyle orderStyle;
                    if (index < asks.length - 1) {
                      orderStyle = OrderWidgetStyle.askOrder;
                    } else if (index == asks.length - 1) {
                      orderStyle = OrderWidgetStyle.highlightedAskOrder;
                    }

                    return OrderWidget(
                      order: asks[index],
                      style: orderStyle,
                    );
                  },
                )
              ),
              ListTile(
                  title: Text(
                    '${spread.toStringAsFixed(2)} BRL spread',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: bids.length,
                  itemBuilder: (BuildContext context, int index) {
                    OrderWidgetStyle orderStyle;
                    if (index == 0) {
                      orderStyle = OrderWidgetStyle.highlighteBidOrder;
                    } else {
                      orderStyle = OrderWidgetStyle.bidOrder;
                    }

                    return OrderWidget(
                      order: bids[index],
                      style: orderStyle,
                    );
                  },
                )
              ),
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
