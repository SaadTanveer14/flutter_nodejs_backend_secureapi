import 'package:envied/envied.dart';

part 'env/env.g.dart';

@Envied(path: 'lib/env/.env')
abstract class Env {
  @EnviedField(varName: 'IMAGE_API', obfuscate: true)
  static final imageAPI = _Env.imageAPI;

}


// ****************************Obfuscate your whole app*********************************
//                  https://docs.flutter.dev/deployment/obfuscate


// ****************************to genenerate env.g.dart*********************************
// flutter pub run build_runner build --delete-conflicting-outputs
