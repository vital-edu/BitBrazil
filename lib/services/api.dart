import 'package:bit_brazil/models/ticker.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'https://api.bitpreco.com/btc-brl';

Future<Ticker> getTicker() async {
  final response = await http.get('$baseUrl/ticker');
  return tickerFromJson(response.body);
}
