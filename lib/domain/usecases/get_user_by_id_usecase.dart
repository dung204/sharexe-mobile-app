import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/core/usecase/usecase.dart';
import 'package:sharexe/domain/entities/user.dart';
import 'package:sharexe/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserByIdUseCase extends UseCase<User, int> {
  GetUserByIdUseCase(this._repository);
  final UserRepository _repository;

  @override
  Future<Result<User>> call(int params) async {
    return await _repository.getUserById(params);
  }
}
