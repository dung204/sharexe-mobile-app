import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/core/usecase/usecase.dart';
import 'package:sharexe/domain/entities/user.dart';
import 'package:sharexe/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUsersUseCase extends UseCaseWithoutParams<List<User>> {
  GetUsersUseCase(this._repository);
  final UserRepository _repository;

  @override
  Future<Result<List<User>>> call() async {
    return await _repository.getUsers();
  }
}
