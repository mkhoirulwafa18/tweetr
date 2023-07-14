import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:fpdart/fpdart.dart';

import '../core/core.dart';

abstract class IAuthAPI {
  FutureEither<User> signUp({
    required String email,
    required String password,
  });
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({required Account account}) : _account = account;

  @override
  FutureEither<User> signUp(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
          email: email, password: password, userId: ID.unique());
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(
          e.message ?? 'Some unexpected error occured when signup',
          stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}

// TODO(mkhoirulwafa18): continue on this https://youtu.be/njLEDvoDjtk?t=4629