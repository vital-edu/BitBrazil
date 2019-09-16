import 'package:bit_brazil/models/order.dart';
import 'package:flutter/material.dart';

enum OrderWidgetStyle {
  askOrder, bidOrder, highlightedAskOrder, highlighteBidOrder
}
class OrderWidget extends StatelessWidget {
  final Order order;
  final OrderWidgetStyle style;

  const OrderWidget({
    Key key,
    @required this.order,
    @required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle orderStyle;
    switch (style) {
      case OrderWidgetStyle.askOrder:
        orderStyle = TextStyle(
          color: Color(0xffdf4d33),
          fontWeight: FontWeight.bold
        );
        break;
      case OrderWidgetStyle.bidOrder:
        orderStyle = TextStyle(
          color: Color(0xff2186bf),
          fontWeight: FontWeight.bold,
        );
        break;
      case OrderWidgetStyle.highlightedAskOrder:
        orderStyle = TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        );
        break;
      case OrderWidgetStyle.highlighteBidOrder:
        orderStyle = TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        );
        break;
    }

    Color listTileColor;
    if (style == OrderWidgetStyle.highlighteBidOrder) {
      listTileColor = Color(0xff2186bf);
    } else if (style == OrderWidgetStyle.highlightedAskOrder) {
      listTileColor = Color(0xffdf4d33);
    }

    return Container(
      child: ListTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                order.price.toStringAsFixed(2),
                style: orderStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                order.amount.toStringAsFixed(8),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      color: listTileColor,
    );
  }
}
