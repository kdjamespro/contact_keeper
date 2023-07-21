import 'package:contact_keeper/features/contact_keeper/domain/entities/contact_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ContactEvent extends Equatable {
  final ContactEntity? contact;

  const ContactEvent({this.contact});

  @override
  List<Object> get props => [contact!];
}

class GetAllContacts extends ContactEvent {
  const GetAllContacts();
}

class CreateContact extends ContactEvent {
  const CreateContact(ContactEntity contact) : super(contact: contact);
}

class DeleteContact extends ContactEvent {
  const DeleteContact(ContactEntity contact) : super(contact: contact);
}

class UpdateContact extends ContactEvent {
  const UpdateContact(ContactEntity contact) : super(contact: contact);
}
