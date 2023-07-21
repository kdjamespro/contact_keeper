import 'package:contact_keeper/features/contact_keeper/data/repository_impl/contact_repository_Impl.dart';
import 'package:contact_keeper/features/contact_keeper/domain/repositories/contact_repository.dart';
import 'package:contact_keeper/features/contact_keeper/domain/usecases/create_contact.dart';
import 'package:contact_keeper/features/contact_keeper/domain/usecases/delete_contact.dart';
import 'package:contact_keeper/features/contact_keeper/domain/usecases/get_all_contacts.dart';
import 'package:contact_keeper/features/contact_keeper/domain/usecases/update_contact.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/bloc/contact/contact_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:contact_keeper/features/contact_keeper/data/datasources/local/app_database.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  s1.registerSingleton<AppDatabase>(database);

  s1.registerSingleton<ContactRepository>(ContactRepositoryImpl(s1()));

  s1.registerSingleton<GetAllContactsUseCase>(GetAllContactsUseCase(s1()));
  s1.registerSingleton<CreateContactUseCase>(CreateContactUseCase(s1()));
  s1.registerSingleton<DeleteContactUseCase>(DeleteContactUseCase(s1()));
  s1.registerSingleton<UpdateContactUseCase>(UpdateContactUseCase(s1()));

  s1.registerFactory<ContactBloc>(() => ContactBloc(s1(), s1(), s1(), s1()));
}
