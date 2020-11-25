class MyRoute {
  int id;
  String name;
  String img;
  int floor_1;
  int floor_2;
  bool is_anytime;
  String time_from;
  String time_to;
  List<bool> on_day = List.generate(7, (_) => false);

  MyRoute({
    this.id,
    this.name,
    this.img,
    this.floor_1,
    this.floor_2,
    this.is_anytime,
    this.time_from,
    this.time_to,
  });

  MyRoute.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.img = map['img'];
    this.floor_1 = map['floor1'];
    this.floor_2 = map['floor2'];
    this.time_from = map['timeFrom'];
    this.time_to = map['timeTo'];
    this.is_anytime = (map['isAnytime'] == 1) ? true : false;
    if (map['sun'] == 1) on_day[0] = true;
    if (map['mon'] == 1) on_day[1] = true;
    if (map['tue'] == 1) on_day[2] = true;
    if (map['wed'] == 1) on_day[3] = true;
    if (map['thu'] == 1) on_day[4] = true;
    if (map['fri'] == 1) on_day[5] = true;
    if (map['sat'] == 1) on_day[6] = true;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': this.name,
      'img': this.img,
      'floor1': this.floor_1,
      'floor2': this.floor_2,
      'isAnytime': this.is_anytime ? 1 : 0,
      'timeFrom': this.time_from,
      'timeTo': this.time_to,
      'sun': this.on_day[0] ? 1 : 0,
      'mon': this.on_day[1] ? 1 : 0,
      'tue': this.on_day[2] ? 1 : 0,
      'wed': this.on_day[3] ? 1 : 0,
      'thu': this.on_day[4] ? 1 : 0,
      'fri': this.on_day[5] ? 1 : 0,
      'sat': this.on_day[6] ? 1 : 0,
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  String toString() {
    return '$id/$name/$img/$floor_1/$floor_2/$is_anytime/$time_from/$time_to/$on_day';
  }
}
