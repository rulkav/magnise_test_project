class WebSocketCryptoModel_ohlcv {
  String? type;
  String? symbolId;
  int? sequence;
  String? timePeriodStart;
  String? timePeriodEnd;
  String? timeOpen;
  String? timeClose;
  dynamic priceOpen;
  dynamic priceHigh;
  dynamic priceLow;
  dynamic priceClose;
  dynamic volumeTraded;
  int? tradesCount;

  WebSocketCryptoModel_ohlcv(
      {this.type,
      this.symbolId,
      this.sequence,
      this.timePeriodStart,
      this.timePeriodEnd,
      this.timeOpen,
      this.timeClose,
      this.priceOpen,
      this.priceHigh,
      this.priceLow,
      this.priceClose,
      this.volumeTraded,
      this.tradesCount});

  WebSocketCryptoModel_ohlcv.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    symbolId = json['symbol_id'];
    sequence = json['sequence'];
    timePeriodStart = json['time_period_start'];
    timePeriodEnd = json['time_period_end'];
    timeOpen = json['time_open'];
    timeClose = json['time_close'];
    priceOpen = json['price_open'];
    priceHigh = json['price_high'];
    priceLow = json['price_low'];
    priceClose = json['price_close'];
    volumeTraded = json['volume_traded'];
    tradesCount = json['trades_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['symbol_id'] = symbolId;
    data['sequence'] = sequence;
    data['time_period_start'] = timePeriodStart;
    data['time_period_end'] = timePeriodEnd;
    data['time_open'] = timeOpen;
    data['time_close'] = timeClose;
    data['price_open'] = priceOpen;
    data['price_high'] = priceHigh;
    data['price_low'] = priceLow;
    data['price_close'] = priceClose;
    data['volume_traded'] = volumeTraded;
    data['trades_count'] = tradesCount;
    return data;
  }
}
