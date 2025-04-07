import '../../../../core/shared/shared.dart';

class ContactsEntity extends Equatable {
  final String guid;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String avatar;

  const ContactsEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.avatar,
    required this.guid,
  });

  @override
  List<Object?> get props => [guid, name, email, phone, address, avatar];
}
