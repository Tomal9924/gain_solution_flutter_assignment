import '../../../../core/shared/shared.dart';
import '../../contacts.dart';

class ContactsModel extends ContactsEntity {
  const ContactsModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.address,
    required super.avatar,
    required super.guid,
  });

  factory ContactsModel.parse({required Map<String, dynamic> map}) {
    try {
      return ContactsModel(
        name: map['name'] as String,
        email: map['email'] as String,
        phone: map['phone'] as String,
        address: map['address'] as String,
        avatar: map['avatar'] as String,
        guid: map['guid'] as String,
      );
    } catch (e, stackTrace) {
      throw ContactsModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
