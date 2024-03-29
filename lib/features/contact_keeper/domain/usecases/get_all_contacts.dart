import 'package:contact_keeper/features/contact_keeper/domain/entities/contact_entity.dart';
import 'package:contact_keeper/features/contact_keeper/domain/repositories/contact_repository.dart';
import 'package:contact_keeper/core/usecase/usecase.dart';

class GetAllContactsUseCase implements UseCase<List<ContactEntity>, void> {
  final ContactRepository _contactKeeperRepository;

  GetAllContactsUseCase(this._contactKeeperRepository);

  @override
  Future<List<ContactEntity>> call({void params}) async {
    return await _contactKeeperRepository.getAllContacts();
  }
}
