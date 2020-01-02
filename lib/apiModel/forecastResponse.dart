class ForecastDetailAttr {
  final String code;
  final String when;

  ForecastDetailAttr({ this.code,this.when});

  factory ForecastDetailAttr.fromJson(Map<String,dynamic> json){
    return ForecastDetailAttr(
      code : json['code'],
      when: json['when'],
    );
  }
}

class ForecastDetail {
  final String locationname;
  final String value;
  final ForecastDetailAttr attributes;

  ForecastDetail({ this.locationname,this.value,this.attributes});

  factory ForecastDetail.fromJson(Map<String,dynamic> json){
    return ForecastDetail(
      locationname : json['locationname'],
      value: json['value'].toString(),
      attributes: ForecastDetailAttr.fromJson(json['attributes'])
    );
  }
}

class ForecastResults {

  final List<ForecastDetail> results;

  ForecastResults({this.results});

  factory ForecastResults.fromJson(Map<String,dynamic> json){

    var list = json['results'] as List;
    List<ForecastDetail> forecastList = list.map((i) => ForecastDetail.fromJson(i)).toList();

    return ForecastResults(results: forecastList);
  }
}