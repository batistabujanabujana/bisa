class DetailAgentModel{
  final Agent? data;

  DetailAgentModel({
    required this.data
  });

  factory DetailAgentModel.fromJson(json){
    return DetailAgentModel(
      data: Agent.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data,
  };

}

class Agent{
  final String? uuid;
  final String? displayName;
  final String? developerName;
  final String? displayIcon;
  final String? fullPortrait;
  final String? description;
  // final List<String>? abilities;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.developerName,
    required this.displayIcon,
    required this.fullPortrait,
    required this.description,
  });

  factory Agent.fromJson(json){
    // factory Agent.fromJson(Map<String, dynamic> json){
    return Agent(
      uuid: json['uuid'] as String?,
      displayName: json['displayName'] as String?,
      developerName: json['developerName'] as String?,
      displayIcon: json['displayIcon'] as String?,
      fullPortrait: json['fullPortrait'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'uuid': uuid,
    'displayName': displayName,
    'developerName': developerName,
    'displayIcon': displayIcon,
    'fullPortrait': fullPortrait,
    'description': description,
  };

}