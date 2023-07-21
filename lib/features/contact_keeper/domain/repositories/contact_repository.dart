import 'package:contact_keeper/features/contact_keeper/domain/entities/contact_entity.dart';

abstract class ContactRepository {
  Future<List<ContactEntity>> getAllContacts();

  Future<void> createContact(ContactEntity contact);

  Future<void> updateContact(ContactEntity contact);

  Future<void> deleteContact(ContactEntity contact);
}
