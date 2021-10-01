import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.type,
    required this.geometry,
    required this.properties,
    required this.header,
    required this.messages,
    required this.parameters,
    required this.times,
  });

  String type;
  Geometry geometry;
  Properties properties;
  Header header;
  List<dynamic> messages;
  Parameters parameters;
  Times times;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    type: json["type"],
    geometry: Geometry.fromJson(json["geometry"]),
    properties: Properties.fromJson(json["properties"]),
    header: Header.fromJson(json["header"]),
    messages: List<dynamic>.from(json["messages"].map((x) => x)),
    parameters: Parameters.fromJson(json["parameters"]),
    times: Times.fromJson(json["times"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "geometry": geometry.toJson(),
    "properties": properties.toJson(),
    "header": header.toJson(),
    "messages": List<dynamic>.from(messages.map((x) => x)),
    "parameters": parameters.toJson(),
    "times": times.toJson(),
  };
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class Header {
  Header({
    required this.title,
    required this.api,
    required this.fillValue,
    required this.start,
    required this.end,
  });

  String title;
  Api api;
  int fillValue;
  String start;
  String end;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
    title: json["title"],
    api: Api.fromJson(json["api"]),
    fillValue: json["fill_value"],
    start: json["start"],
    end: json["end"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "api": api.toJson(),
    "fill_value": fillValue,
    "start": start,
    "end": end,
  };
}

class Api {
  Api({
    required this.version,
    required this.name,
  });

  String version;
  String name;

  factory Api.fromJson(Map<String, dynamic> json) => Api(
    version: json["version"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "name": name,
  };
}

class Parameters {
  Parameters({
    required this.ts,
    required this.qv2M,
    required this.ws2M,
    required this.cloudAmt,
  });

  CloudAmt ts;
  CloudAmt qv2M;
  CloudAmt ws2M;
  CloudAmt cloudAmt;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
    ts: CloudAmt.fromJson(json["TS"]),
    qv2M: CloudAmt.fromJson(json["QV2M"]),
    ws2M: CloudAmt.fromJson(json["WS2M"]),
    cloudAmt: CloudAmt.fromJson(json["CLOUD_AMT"]),
  );

  Map<String, dynamic> toJson() => {
    "TS": ts.toJson(),
    "QV2M": qv2M.toJson(),
    "WS2M": ws2M.toJson(),
    "CLOUD_AMT": cloudAmt.toJson(),
  };
}

class CloudAmt {
  CloudAmt({
    required this.units,
    required this.longname,
  });

  String units;
  String longname;

  factory CloudAmt.fromJson(Map<String, dynamic> json) => CloudAmt(
    units: json["units"],
    longname: json["longname"],
  );

  Map<String, dynamic> toJson() => {
    "units": units,
    "longname": longname,
  };
}

class Properties {
  Properties({
    required this.parameter,
  });

  Parameter parameter;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    parameter: Parameter.fromJson(json["parameter"]),
  );

  Map<String, dynamic> toJson() => {
    "parameter": parameter.toJson(),
  };
}

class Parameter {
  Parameter({
    required this.ts,
    required this.qv2M,
    required this.ws2M,
    required this.cloudAmt,
  });

  Map<String, double> ts;
  Map<String, double> qv2M;
  Map<String, double> ws2M;
  Map<String, double> cloudAmt;

  factory Parameter.fromJson(Map<String, dynamic> json) => Parameter(
    ts: Map.from(json["TS"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    qv2M: Map.from(json["QV2M"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    ws2M: Map.from(json["WS2M"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    cloudAmt: Map.from(json["CLOUD_AMT"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "TS": Map.from(ts).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "QV2M": Map.from(qv2M).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "WS2M": Map.from(ws2M).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "CLOUD_AMT": Map.from(cloudAmt).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Times {
  Times({
    required this.data,
    required this.process,
  });

  double data;
  double process;

  factory Times.fromJson(Map<String, dynamic> json) => Times(
    data: json["data"].toDouble(),
    process: json["process"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "process": process,
  };
}
