class DiceModel {
  int? id;
  String? name;
  DiceModel({this.id, this.name});
}

List<DiceModel> leftList = [
  DiceModel(id: 4, name: '1 - 72'),
  DiceModel(id: 5, name: '1 - 36'),
  DiceModel(id: 6, name: '1 - 22'),
  DiceModel(id: 7, name: '1 - 14'),
  DiceModel(id: 8, name: '1 - 10'),
  DiceModel(id: 9, name: '1 - 9'),
  DiceModel(id: 10, name: '1 - 8'),
  DiceModel(id: 18, name: 'LE'),
];

List<DiceModel> rightList = [
  DiceModel(id: 11, name: '1 - 72'),
  DiceModel(id: 12, name: '1 - 36'),
  DiceModel(id: 13, name: '1 - 22'),
  DiceModel(id: 14, name: '1 - 14'),
  DiceModel(id: 15, name: '1 - 10'),
  DiceModel(id: 16, name: '1 - 9'),
  DiceModel(id: 17, name: '1 - 8'),
  DiceModel(id: 19, name: 'CHAN'),
];
