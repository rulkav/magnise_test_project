class HistoryCryptoModel {
  String? timePeriodStart;
  String? timePeriodEnd;
  String? timeOpen;
  String? timeClose;
  double? rateOpen;
  double? rateHigh;
  double? rateLow;
  double? rateClose;

  HistoryCryptoModel(
      {this.timePeriodStart,
      this.timePeriodEnd,
      this.timeOpen,
      this.timeClose,
      this.rateOpen,
      this.rateHigh,
      this.rateLow,
      this.rateClose});

  HistoryCryptoModel.fromJson(Map<String, dynamic> json) {
    timePeriodStart = json['time_period_start'];
    timePeriodEnd = json['time_period_end'];
    timeOpen = json['time_open'];
    timeClose = json['time_close'];
    rateOpen = json['rate_open'];
    rateHigh = json['rate_high'];
    rateLow = json['rate_low'];
    rateClose = json['rate_close'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time_period_start'] = timePeriodStart;
    data['time_period_end'] = timePeriodEnd;
    data['time_open'] = timeOpen;
    data['time_close'] = timeClose;
    data['rate_open'] = rateOpen;
    data['rate_high'] = rateHigh;
    data['rate_low'] = rateLow;
    data['rate_close'] = rateClose;
    return data;
  }
}
