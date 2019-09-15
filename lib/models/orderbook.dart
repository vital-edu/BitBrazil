import 'dart:convert';

import 'order.dart';

Orderbook orderbookFromJson(String str) => Orderbook.fromJson(json.decode(str));

class Orderbook {
    List<Order> bids;
    List<Order> asks;
    DateTime timestamp;

    Orderbook({
        this.bids,
        this.asks,
        this.timestamp,
    });

    factory Orderbook.fromJson(Map<String, dynamic> json) => Orderbook(
        bids: List<Order>.from(json["bids"].map((x) => Order.fromJson(x))),
        asks: List<Order>.from(json["asks"].map((x) => Order.fromJson(x))),
        timestamp: DateTime.parse(json["timestamp"]),
    );
}
