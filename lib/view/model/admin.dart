class aadminModel {
  String? name, loction;

  Map peopel = {};

  aadminModel.jsoin(Map map) {
    name = map['name'];
    loction = map['loction'];
  }
  aadminModel.people(Map map) {
    peopel = map;
  }
}
