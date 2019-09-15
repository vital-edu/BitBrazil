import 'dart:convert';

Ticker tickerFromJson(String str) => Ticker.fromJson(json.decode(str));

class Ticker {
    double last;
    double high;
    double low;
    double volume;
    double variation;
    DateTime timestamp;

    Ticker({
        this.last,
        this.high,
        this.low,
        this.volume,
        this.variation,
        this.timestamp,
    });

    factory Ticker.fromJson(Map<String, dynamic> json) => Ticker(
        last: json["last"].toDouble(),
        high: json["high"].toDouble(),
        low: json["low"].toDouble(),
        volume: json["vol"].toDouble(),
        variation: json["var"].toDouble(),
        timestamp: DateTime.parse(json["timestamp"]),
    );
}
