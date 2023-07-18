import 'package:contact_keeper/features/contact_keeper/domain/entities/contact_entity.dart';

abstract class ContactKeeperRepository {
  Future<List<ContactEntity>> getAllContacts();

  Future<ContactEntity> createContact({
    required String name,
    required String phone,
    required String? email,
    required String? address,
  });

  Future<void> updateContact(
    final int id, {
    required String name,
    required String phone,
    required String? email,
    required String? address,
  });

  Future<void> deleteContact(final int id);
}
