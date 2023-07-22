import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final int? _id;
  final String _name;
  final String _phone;
  final String _email;
  final String _address;

  const ContactEntity({
    int? id,
    required String name,
    required String phone,
    String? email,
    String? address,
  })  : _id = id,
        _name = name,
        _phone = phone,
        _email = email ?? '',
        _address = address ?? '';

  @override
  List<Object> get props => [_name, _phone, _email, _address];

  get id => _id;

  get name => _name;

  get phone => _phone;

  get email => _email;

  get address => _address;
}
