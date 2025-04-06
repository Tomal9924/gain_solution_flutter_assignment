import '../shared.dart';

class Address extends Equatable {
  final String street;
  final String city;
  final String state;
  final String zip;

  const Address({
    required this.street,
    required this.city,
    required this.state,
    required this.zip,
  });

  @override
  List<Object?> get props => [
        zip,
        state,
        city,
        street,
      ];
}
