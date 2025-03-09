import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';

class PostLogout extends UseCase<void, NoParams> {
  final AuthRepository _repo;

// coverage:ignore-start
  PostLogout(this._repo);

  @override
  Future<Either<Failure, void>> call(NoParams _) async {
    final result = await _repo.logout();
    return result.fold((failure) => Left(failure), (success) => Right(success));
  }
// coverage:ignore-end
}
