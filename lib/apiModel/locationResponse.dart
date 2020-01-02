class LocationDetail {

  final String id;
  final String name;
  final String locationrootid;

  LocationDetail({this.id,this.name,this.locationrootid});

  factory LocationDetail.fromJson(Map<String,dynamic> json){
    return LocationDetail(
      id: json['id'],
      name: json['name'],
      locationrootid: json['locationrootid']
    );
  }
}

class LocationResults {
  final List<LocationDetail> results;

  LocationResults({this.results});

  factory LocationResults.fromJson(Map<String,dynamic> json){
    var list = json['results'] as List;
    List<LocationDetail> locationList = list.map((i) => LocationDetail.fromJson(i)).toList();

    return LocationResults(results: locationList);
  }
}