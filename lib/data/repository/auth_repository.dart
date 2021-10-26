import 'package:app/data/local/app_user.dart';
import 'package:app/data/model/result.dart';

abstract class AuthRepository {
  Future<Result<AppUser>> signIn();

  Future<Result<void>> signOut();
}
