import 'package:floor/floor.dart';
import 'package:contact_keeper/features/contact_keeper/domain/entities/contact_entity.dart';

@Entity(tableName: 'contacts', primaryKeys: ['id'])
class ContactModel extends ContactEntity {
  @override
  @PrimaryKey(autoGenerate: true)
  int? id;
  ContactModel({
    this.id,
    required String name,
    required String phone,
    String email = '',
    String address = '',
  }) : super(
          id: id,
          phone: phone,
          name: name,
          email: email,
          address: address,
        );

  factory ContactModel.fromEntity(ContactEntity entity) {
    return ContactModel(
        id: entity.id,
        name: entity.name,
        phone: entity.phone,
        email: entity.email,
        address: entity.address);
  }
}
