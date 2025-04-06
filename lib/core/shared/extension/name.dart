import '../shared.dart';

extension NameExtension on Name {
  String get full {
    return '${first.trim()} ${last.trim()}'.trim();
  }

  String get symbol =>
      '${full.isNotEmpty ? full.substring(0, 1) : ""}${full.isNotEmpty ? full.substring(0, 1) : ""}'
          .trim();

  Name copyWith({
    String? first,
    String? last,
  }) {
    return Name(
      first: first ?? this.first,
      last: last ?? this.last,
    );
  }

  Name clone({
    required Name name,
  }) {
    return Name.full(name: name.full);
  }
}
