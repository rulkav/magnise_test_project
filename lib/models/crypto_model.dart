class CryptoModel {
  String? time;
  String? assetIdBase;
  String? assetIdQuote;
  dynamic rate;
  List<SrcSideBase>? srcSideBase;

  CryptoModel(
      {this.time,
      this.assetIdBase,
      this.assetIdQuote,
      this.rate,
      this.srcSideBase});

  CryptoModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    assetIdBase = json['asset_id_base'];
    assetIdQuote = json['asset_id_quote'];
    rate = json['rate'];
    if (json['src_side_base'] != null) {
      srcSideBase = <SrcSideBase>[];
      json['src_side_base'].forEach((v) {
        srcSideBase!.add(SrcSideBase.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['asset_id_base'] = assetIdBase;
    data['asset_id_quote'] = assetIdQuote;
    data['rate'] = rate;
    if (srcSideBase != null) {
      data['src_side_base'] = srcSideBase!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SrcSideBase {
  String? time;
  String? asset;
  dynamic rate;
  dynamic volume;

  SrcSideBase({this.time, this.asset, this.rate, this.volume});

  SrcSideBase.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    asset = json['asset'];
    rate = json['rate'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['asset'] = asset;
    data['rate'] = rate;
    data['volume'] = volume;
    return data;
  }
}
