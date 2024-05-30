class MapModel{
  final List<Maps>? data;

  MapModel({
    required this.data
  });

  factory MapModel.fromJson(Map<String, dynamic> json){
    return MapModel(
      data: (json['data'] as List?)?.map((dynamic e) => Maps.fromJson(e as Map<String,dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data,
  };

}

class Maps{
  final String? uuid;
  final String? displayName;
  final String? coordinates;
  final String? displayIcon;

  Maps({
    required this.uuid,
    required this.displayName,
    required this.coordinates,
    required this.displayIcon,
  });

  factory Maps.fromJson(Map<String, dynamic> json){
    return Maps(
      uuid: json['uuid'] as String?,
      displayName: json['displayName'] as String?,
      coordinates: json['coordinates'] as String?,
      displayIcon: json['displayIcon'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'uuid': uuid,
    'displayName': displayName,
    'coordinates': coordinates,
    'displayIcon': displayIcon,
  };

}