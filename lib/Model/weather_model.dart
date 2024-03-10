class Weather {
  double? tEMPERATURE;
  int? tWD;
  double? pRESSURE;
  int? rAINMONTH;
  double? tWSGUST;
  int? rAINDAY;
  int? rAIN;
  int? hUMIDITY;
  double? tWS;
  String? tIMESTRING;
  int? tWDGUST;
  int? tIME;
  double? lATITUDE;
  double? lONGITUDE;
  int? lOCALTIME;

  Weather(
      {this.tEMPERATURE,
      this.tWD,
      this.pRESSURE,
      this.rAINMONTH,
      this.tWSGUST,
      this.rAINDAY,
      this.rAIN,
      this.hUMIDITY,
      this.tWS,
      this.tIMESTRING,
      this.tWDGUST,
      this.tIME,
      this.lATITUDE,
      this.lONGITUDE,
      this.lOCALTIME});

  Weather.fromJson(Map<String, dynamic> json) {
    tEMPERATURE = json['TEMPERATURE'];
    tWD = json['TWD'];
    pRESSURE = json['PRESSURE'];
    rAINMONTH = json['RAIN_MONTH'];
    tWSGUST = json['TWS_GUST'];
    rAINDAY = json['RAIN_DAY'];
    rAIN = json['RAIN'];
    hUMIDITY = json['HUMIDITY'];
    tWS = json['TWS'];
    tIMESTRING = json['TIME_STRING'];
    tWDGUST = json['TWD_GUST'];
    tIME = json['TIME'];
    lATITUDE = json['LATITUDE'];
    lONGITUDE = json['LONGITUDE'];
    lOCALTIME = json['LOCALTIME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TEMPERATURE'] = tEMPERATURE;
    data['TWD'] = tWD;
    data['PRESSURE'] = pRESSURE;
    data['RAIN_MONTH'] = rAINMONTH;
    data['TWS_GUST'] = tWSGUST;
    data['RAIN_DAY'] = rAINDAY;
    data['RAIN'] = rAIN;
    data['HUMIDITY'] = hUMIDITY;
    data['TWS'] = tWS;
    data['TIME_STRING'] = tIMESTRING;
    data['TWD_GUST'] = tWDGUST;
    data['TIME'] = tIME;
    data['LATITUDE'] = lATITUDE;
    data['LONGITUDE'] = lONGITUDE;
    data['LOCALTIME'] = lOCALTIME;
    return data;
  }
}
