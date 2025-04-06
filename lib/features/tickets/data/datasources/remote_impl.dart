import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

class TicketsRemoteDataSourceImpl extends TicketsRemoteDataSource {
  final Client client;

  TicketsRemoteDataSourceImpl({required this.client});

  @override
  FutureOr<List<TicketsModel>> findAll() async {
    try {
      final payload = await rootBundle.loadString(
        'assets/mocks/get_all_tickets.json',
      );
      final Response response = Response(payload, HttpStatus.ok);
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> result = Map<String, dynamic>.from(
          json.decode(response.body),
        );
        if (result['success'] as bool) {
          return List<TicketsModel>.from(
            result["result"].map((x) => TicketsModel.parse(map: x)),
          );
        } else {
          throw TicketsModelParseFailure(
            message: 'Ticket Model parse issue',
            stackTrace: null,
          );
        }
      } else {
        throw RemoteFailure(message: 'Server Error');
      }
    } catch (e) {
      throw RemoteFailure(message: 'Something went wrong!');
    }
  }

  @override
  FutureOr<void> refresh() async {
    throw UnimplementedError();
  }
}
