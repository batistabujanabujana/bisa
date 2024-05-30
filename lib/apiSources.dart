import 'baseNetwork.dart';

class ApiSo {
  static Future loadAgents(){
    return BaseNetwork.get("agents");
  }

  static Future loadMaps() {
    return BaseNetwork.get("maps");
  }

  static Future detailAgent(uuid){
    return BaseNetwork.get("agents/$uuid");
  }

}