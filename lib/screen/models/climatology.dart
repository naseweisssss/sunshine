class Climatology {
  String SkinTemperature;
  String Humidity;
  String Wind;
  String Cloud;

  Climatology({
    required this.SkinTemperature,
    required this.Humidity,
    required this.Wind,
    required this.Cloud,
  });

  Climatology.copy(Climatology from)
      : this(
      SkinTemperature: from.SkinTemperature,
      Humidity: from.Humidity,
      Wind: from.Wind,
      Cloud: from.Cloud,
  );

  Climatology.fromJson(Map<String, dynamic> json)
      : this(
      SkinTemperature: json['TS'],
      Humidity: json['QV2M'],
      Wind: json['WS2M'],
      Cloud: json['CLOUD_AMT']);

  Map<String, dynamic> toJson() =>
      {'TS': SkinTemperature,
        'QV2M': Humidity,
        'WS2M': Wind,
        'CLOUD_AMT': Cloud};
}