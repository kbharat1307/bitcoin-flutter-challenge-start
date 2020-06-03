import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'DF50093F-3C21-4C2F-A73A-33F4920EF722';

class CoinData {
  final String url;

  CoinData(this.url);

  Future getCoinData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var responseData = jsonDecode(data);
      double coinRate = responseData['rate'];
      int rate = coinRate.toInt();
      return rate;
    } else {
      print(response.statusCode);
    }
  }
}
