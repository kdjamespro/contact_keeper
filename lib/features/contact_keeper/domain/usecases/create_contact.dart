import 'package:contact_keeper/features/contact_keeper/domain/entities/contact_entity.dart';
import 'package:contact_keeper/features/contact_keeper/domain/repositories/contact_repository.dart';
import 'package:contact_keeper/core/usecase/usecase.dart';

class CreateContactUseCase implements UseCase<void, ContactEntity> {
  final ContactRepository _contactKeeperRepository;

  CreateContactUseCase(this._contactKeeperRepository);

  @override
  Future<void> call({ContactEntity? params}) async {
    return await _contactKeeperRepository.createContact(params!);
  }
}
