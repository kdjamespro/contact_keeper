import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String address;

  const ContactEntity({
    required this.id,
    required this.name,
    this.phone = '',
    this.email = '',
    this.address = '',
  });

  @override
  List<Object> get props => [name, phone, email, address];
}
