class Preference {
  int id;
  String doorHoldT;
  // List<Map<String, String>> buildings;
  List<String> buildings = [];

  Preference({this.doorHoldT, this.buildings});

  Preference.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.doorHoldT = map['doorHoldT'];
    if (map['buildings'].length > 0) {
      this.buildings = map['buildings'].split('_');
    }
    else {this.buildings = [];}
    // var buildinglist = map['buildings'].split('_');
    // for (String b in buildinglist) {
    //   // var nameAddr = b.split('-');
    //   // this.buildings.add({nameAddr[0]: nameAddr[1]});
    //   this.buildings.add(b);
    // }
  }

  Map<String, dynamic> toMap() {
    // for (Map<String,String> b in buildings) {
    //   String entity = b.keys.first + '-' + b.values.first;
    //   buildinglist += entity+'_';
    // }
    String buildinglist = '';
    if (this.buildings.length > 0) {
      for (String b in this.buildings) {
        buildinglist += b + '_';
      }
      buildinglist = buildinglist.substring(0, buildinglist.length - 1);
    }

    Map<String, dynamic> map = {
      'doorHoldT': this.doorHoldT,
      'buildings': buildinglist
    };

    return map;
  }

  String toString() {
    return 'id: ${this.id}, doorHoldT: ${this.doorHoldT}, buildings: ${this.buildings}';
  }
}
