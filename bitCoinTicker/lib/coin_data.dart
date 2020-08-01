import 'package:http/http.dart';
import 'apiKey.dart';
import 'dart:convert';

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

const baseURL = 'https://rest.coinapi.io/v1/exchangerate/';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> prices = {};
    for (String crypto in cryptoList) {
      Response response =
          await get('$baseURL$crypto/$selectedCurrency?apiKey=$apiKey');
      if (response.statusCode == 200) {
        double lastPrice = jsonDecode(response.body)['rate'];
        prices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        throw 'Problem with the get request';
      }
    }
    print(prices);
    return prices;
  }
}
