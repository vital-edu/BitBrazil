import 'dart:convert';

List<Exchange> exchangesFromJson(String str) => List<Exchange>.from(json.decode(str).map((x) => Exchange.fromJson(x)));

class Exchange {
    String name;
    double execution;
    double deposit;
    double withdrawal;
    double bid;
    double ask;
    DateTime timestamp;

    Exchange({
        this.name,
        this.execution,
        this.deposit,
        this.withdrawal,
        this.bid,
        this.ask,
        this.timestamp,
    });

    factory Exchange.fromJson(Map<String, dynamic> json) => Exchange(
        name: json["name"],
        execution: json["execution"].toDouble(),
        deposit: json["deposit"].toDouble(),
        withdrawal: json["withdrawal"].toDouble(),
        bid: json["bid"].toDouble(),
        ask: json["ask"].toDouble(),
        timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    );
}
