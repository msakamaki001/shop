import 'package:chopper/chopper.dart';

class ApiClientCreator {
  static final String baseUrl = 'http://localhost';

  static ChopperClient create() {
    return ChopperClient(
      baseUrl: ApiClientCreator.baseUrl,
      converter: JsonConverter(),
    );
  }
}
