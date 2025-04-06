import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

class TicketsModel extends TicketsEntity {
  // TODO: implement model properties
  TicketsModel({
    required super.identity,
  });

  factory TicketsModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw TicketsModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
