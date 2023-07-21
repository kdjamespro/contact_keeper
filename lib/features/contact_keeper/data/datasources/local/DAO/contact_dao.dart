import 'package:contact_keeper/features/contact_keeper/data/models/contact_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class ContactDao {
  @Insert()
  Future<void> createContact(ContactModel contactModel);

  @delete
  Future<void> deleteContact(ContactModel contactModel);

  @update
  Future<void> updateContact(ContactModel contactModel);

  @Query('SELECT * FROM contacts')
  Future<List<ContactModel>> getAllContacts();
}
