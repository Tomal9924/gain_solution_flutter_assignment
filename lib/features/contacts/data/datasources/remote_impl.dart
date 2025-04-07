import '../../../../core/shared/shared.dart';
import '../../contacts.dart';

class ContactsRemoteDataSourceImpl extends ContactsRemoteDataSource {
  final Client client;

  ContactsRemoteDataSourceImpl({required this.client});

  @override
  FutureOr<List<ContactsModel>> findAll() async {
    try {
      final payload = await rootBundle.loadString(
        'assets/mocks/get_all_contacts.json',
      );
      final Response response = Response(payload, HttpStatus.ok);
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> result = Map<String, dynamic>.from(
          json.decode(response.body),
        );
        if (result['success'] as bool) {
          return List<ContactsModel>.from(
            result["result"].map((x) => ContactsModel.parse(map: x)),
          );
        } else {
          throw TicketsModelParseFailure(
            message: 'Contacts Model parse issue',
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
  FutureOr<void> find() async {
    throw UnimplementedError();
  }
}
