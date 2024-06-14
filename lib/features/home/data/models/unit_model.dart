class UnitModel {
  String? unitNo;
  String? unitName;

  UnitModel({required this.unitName, this.unitNo});

  UnitModel.fromJson(Map<String, dynamic> json) {
    unitNo = json['unitNo'];
    unitName = json['unitName'];
  }

  Map<String, dynamic> toJson() {
    return {'unitNo': unitNo, 'unitName': unitName};
  }
}
