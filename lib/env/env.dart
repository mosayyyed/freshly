import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'APIKEY', obfuscate: true)
  static final String apiKey = _Env.apiKey;
  @EnviedField(varName: 'ENDPOINT')
  static const String endPoint = _Env.endPoint;
}
