class User {
  String? _name;
  String? _email;
  String? _id;

  String get name => _name!;

  String get email => _email!;

  String get id => _id!;

  void set name(String name) {
    _name = name;
  }

  void set email(String email) {
    _email = email;
  }

  void set id(String id) {
    _id = id;
  }

  User(this._name, this._email, this._id);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };

  static User fromJson(Map<String, dynamic> json) =>
      User(json['name'], json['email'], json['id']);
}
