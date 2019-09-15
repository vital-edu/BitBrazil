import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

class Order {
    double amount;
    double price;
    String id;

    Order({
        this.amount,
        this.price,
        this.id,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        amount: json["amount"].toDouble(),
        price: json["price"].toDouble(),
        id: json["id"],
    );
}
