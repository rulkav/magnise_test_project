class AppUrlRequestKeys {
  AppUrlRequestKeys._();

  // API
  static const String baseUrl = 'http://rest.coinapi.io';
  static const String currencyRate = '/v1/assets?filter_asset_id='; //+'BTC;USD'
  static const String exchange = '/v1/exchangerate/'; //+'BTC/USD'
  //'v1/exchangerate/SOL/USD/'+
  static const String historyPeriod =
      '/history?period_id=1DAY&time_start=2022-02-01T00:00:00&time_end=2022-02-28T00:00:00';
  // WebSocket
  static const String webSocketUrl = 'wss://ws.coinapi.io/v1';
}
