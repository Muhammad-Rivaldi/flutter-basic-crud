class ClassPenangkap {
  int _id;
  String _name;
  String _phone;
  ClassPenangkap(this._name, this._phone);
  ClassPenangkap.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._phone = map['phone'];
  }

  int get id => _id;
  String get name => _name;
  String get phone => _phone;
  set name(String value) {
    _name = value;
  }

  set phone(String value) {
    _phone = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['phone'] = phone;
    return map;
  }
}
