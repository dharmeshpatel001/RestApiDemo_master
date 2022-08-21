/// name : "Dharmesh patel"
/// email : "dharmeshbhadiyadra1610@gmail.com"
/// password : "$2a$08$REekQK9GnR1Vczz6f14J/eFhUI4/TOXXgtFW1vYLWlfFZRPiZkp/e"
/// address : ""
/// type : "user"
/// _id : "62a621546a956dc7d8463937"
/// __v : 0

class User {
  User({
      String? name, 
      String? email, 
      String? password, 
      String? address, 
      String? type, 
      String? id, 
      int? v,}){
    _name = name;
    _email = email;
    _password = password;
    _address = address;
    _type = type;
    _id = id;
    _v = v;
}

  User.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _address = json['address'];
    _type = json['type'];
    _id = json['_id'];
    _v = json['__v'];
  }
  String? _name;
  String? _email;
  String? _password;
  String? _address;
  String? _type;
  String? _id;
  int? _v;
User copyWith({  String? name,
  String? email,
  String? password,
  String? address,
  String? type,
  String? id,
  int? v,
}) => User(  name: name ?? _name,
  email: email ?? _email,
  password: password ?? _password,
  address: address ?? _address,
  type: type ?? _type,
  id: id ?? _id,
  v: v ?? _v,
);
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get address => _address;
  String? get type => _type;
  String? get id => _id;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['address'] = _address;
    map['type'] = _type;
    map['_id'] = _id;
    map['__v'] = _v;
    return map;
  }

}