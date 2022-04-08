class WebSocketCryptoModel_Exchange {
  String? type;
  String? assetIdBase;
  String? assetIdQuote;
  String? time;
  dynamic rate;

  WebSocketCryptoModel_Exchange(
      {this.type, this.assetIdBase, this.assetIdQuote, this.time, this.rate});

  WebSocketCryptoModel_Exchange.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    assetIdBase = json['asset_id_base'];
    assetIdQuote = json['asset_id_quote'];
    time = json['time'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['asset_id_base'] = assetIdBase;
    data['asset_id_quote'] = assetIdQuote;
    data['time'] = time;
    data['rate'] = rate;
    return data;
  }
}
