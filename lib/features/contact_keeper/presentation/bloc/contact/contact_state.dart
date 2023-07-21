import 'package:contact_keeper/features/contact_keeper/domain/entities/contact_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ContactState extends Equatable {
  final List<ContactEntity>? contacts;

  const ContactState({this.contacts});

  @override
  List<Object?> get props => [contacts!];
}

class ContactLoading extends ContactState {
  const ContactLoading();
}

class ContactReady extends ContactState {
  const ContactReady(List<ContactEntity> contacts) : super(contacts: contacts);
}
