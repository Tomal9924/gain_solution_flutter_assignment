import '../shared.dart';

extension AddressExtension on Address {
  String get formatted {
    final String firstLine = street.trim();
    final String secondLine =
        '${city.trim().isNotEmpty ? '${city.trim()}, ' : ''}${state.trim().isNotEmpty ? '${state.trim()} ' : ''}${zip.trim().isNotEmpty ? zip.trim() : ''}'
            .trim();
    return '${firstLine.trim()}\n${secondLine.trim()}'.trim();
  }
}
