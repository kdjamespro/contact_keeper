import 'package:floor/floor.dart';
import 'package:contact_keeper/features/contact_keeper/domain/entities/contact_entity.dart';

@Entity(tableName: 'contacts', primaryKeys: ['id'])
class ContactModel extends ContactEntity {
  const ContactModel({
    required int id,
    required String name,
    String phone = '',
    String email = '',
    String address = '',
  }) : super(
          id: id,
          name: name,
          email: email,
          address: address,
        );
}
