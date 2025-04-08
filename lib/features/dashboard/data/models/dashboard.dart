import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

class DashboardModel extends DashboardEntity {
  const DashboardModel({
    required super.identity,
  });

  factory DashboardModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw DashboardModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
