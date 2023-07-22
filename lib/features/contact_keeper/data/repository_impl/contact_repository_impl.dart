import 'package:contact_keeper/features/contact_keeper/data/datasources/local/app_database.dart';
import 'package:contact_keeper/features/contact_keeper/domain/entities/contact_entity.dart';
import 'package:contact_keeper/features/contact_keeper/domain/repositories/contact_repository.dart';
import 'package:contact_keeper/features/contact_keeper/data/models/contact_model.dart';

class ContactRepositoryImpl implements ContactRepository {
  final AppDatabase _appDatabase;

  ContactRepositoryImpl(this._appDatabase);

  @override
  Future<List<ContactModel>> getAllContacts() {
    return _appDatabase.contactDao.getAllContacts();
  }

  @override
  Future<void> createContact(ContactEntity contact) {
    return _appDatabase.contactDao
        .createContact(ContactModel.fromEntity(contact));
  }

  @override
  Future<void> deleteContact(ContactEntity contact) {
    return _appDatabase.contactDao
        .deleteContact(ContactModel.fromEntity(contact));
  }

  @override
  Future<void> updateContact(ContactEntity contact) {
    return _appDatabase.contactDao
        .updateContact(ContactModel.fromEntity(contact));
  }
}
