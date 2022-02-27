class User {
  String? _name;
  String? _email;
  String? _id;
  String? _phone_number;

  String get name => _name!;

  String get email => _email!;

  String get id => _id!;

  String get phone_number => _phone_number!;

  void set name(String name) {
    _name = name;
  }

  void set email(String email) {
    _email = email;
  }

  void set id(String id) {
    _id = id;
  }

  User(this._name, this._email, this._id, this._phone_number);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone_number': phone_number,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        json['name'],
        json['email'],
        json['id'],
        json['phone_number'],
      );
}
