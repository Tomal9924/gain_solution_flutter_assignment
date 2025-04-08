import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class FilterRemoteDataSourceImpl extends FilterRemoteDataSource {
  final Client client;

  FilterRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<List<FilterModel>> find() async {
    try{
      final payload=await rootBundle.loadString("assets/mocks/get_filter_settings.json");
      final Response response=Response(payload,HttpStatus.ok);
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> result = Map<String, dynamic>.from(
          json.decode(response.body),
        );
        if (result['success'] as bool) {
          return List<FilterModel>.from(
            result["filters"].map((x) => FilterModel.parse(map: x)),
          );
        } else {
          throw TicketsModelParseFailure(
            message: 'Filter Model parse issue',
            stackTrace: null,
          );
        }
      } else {
        throw RemoteFailure(message: 'Server Error');
      }
    }
    catch(e){
      throw RemoteFailure(message: 'Server Error');
    }
  }

  @override
  FutureOr<void> findAll() async {
    throw UnimplementedError();
  }
}
