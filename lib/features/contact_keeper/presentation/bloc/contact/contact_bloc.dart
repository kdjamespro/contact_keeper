import 'package:contact_keeper/features/contact_keeper/domain/usecases/create_contact.dart';
import 'package:contact_keeper/features/contact_keeper/domain/usecases/delete_contact.dart';
import 'package:contact_keeper/features/contact_keeper/domain/usecases/get_all_contacts.dart';
import 'package:contact_keeper/features/contact_keeper/domain/usecases/update_contact.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/bloc/contact/contact_event.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/bloc/contact/contact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetAllContactsUseCase _getAllContactsUseCase;
  final CreateContactUseCase _createContactUseCase;
  final DeleteContactUseCase _deleteContactUseCase;
  final UpdateContactUseCase _updateContactUseCase;

  ContactBloc(this._getAllContactsUseCase, this._createContactUseCase,
      this._deleteContactUseCase, this._updateContactUseCase)
      : super(const ContactLoading()) {
    on<GetAllContacts>(onGetAllContacts);
    on<CreateContact>(onCreateContact);
    on<DeleteContact>(onDeleteContact);
    on<UpdateContact>(onUpdateContact);
  }

  void onGetAllContacts(
      GetAllContacts getAllContacts, Emitter<ContactState> emit) async {
    final contacts = await _getAllContactsUseCase();
    emit(ContactReady(contacts));
  }

  void onCreateContact(
      CreateContact createContact, Emitter<ContactState> emit) async {
    print(createContact.contact);
    await _createContactUseCase(params: createContact.contact);
    final contacts = await _getAllContactsUseCase();
    emit(ContactReady(contacts));
  }

  void onDeleteContact(
      DeleteContact deleteContact, Emitter<ContactState> emit) async {
    await _deleteContactUseCase(params: deleteContact.contact);
    final contacts = await _getAllContactsUseCase();
    emit(ContactReady(contacts));
  }

  void onUpdateContact(
      UpdateContact updateContact, Emitter<ContactState> emit) async {
    await _updateContactUseCase(params: updateContact.contact);
    final contacts = await _getAllContactsUseCase();
    emit(ContactReady(contacts));
  }
}
