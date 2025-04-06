import '../shared.dart';

extension IdentityExtension on Identity {
  Identity copyWith({
    int? id,
    String? guid,
  }) {
    return Identity(
      id: id ?? this.id,
      guid: guid ?? this.guid,
    );
  }
}
