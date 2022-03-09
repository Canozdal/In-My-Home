class Person{

String _name;


String _email;

late String _phone_number;


Person(this._name,this._email);

///Documentizing
Map toJson() => {
  'name' : _name,
  'email' : _email,
  'phone_number' : _phone_number,
};


/**
 * Getters and Setters
 */

///name
set name(String value) {
  _name = value;
}

String get name => _name;

///email
String get email => _email;

set email(String value) {
  _email = value;
}

///phone number

String get phone_number => _phone_number;

set phone_number(String value) {
  _phone_number = value;
}
}