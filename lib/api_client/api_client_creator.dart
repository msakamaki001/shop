import 'package:chopper/chopper.dart';

import '../setting.dart';

class ApiClientCreator {
  static final String baseUrl = Setting.BASE_URL;

  static ChopperClient create() {
    return ChopperClient(
      baseUrl: ApiClientCreator.baseUrl,
      converter: JsonConverter(),
    );
  }
}
