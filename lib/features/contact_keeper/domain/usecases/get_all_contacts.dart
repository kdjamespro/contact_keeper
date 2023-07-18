import 'package:contact_keeper/features/contact_keeper/domain/entities/contact_entity.dart';
import 'package:contact_keeper/features/contact_keeper/domain/repositories/contact_keeper_repository.dart';
import 'package:contact_keeper/core/usecase/usecase.dart';

class GetAllContacts implements UseCase<List<ContactEntity>, void> {
  final ContactKeeperRepository contactKeeperRepository;

  GetAllContacts(this.contactKeeperRepository);

  @override
  Future<List<ContactEntity>> call(void params) async {
    return await contactKeeperRepository.getAllContacts();
  }
}
