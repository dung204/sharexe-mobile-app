import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/core/usecase/usecase.dart';
import 'package:sharexe/domain/entities/todo.dart';
import 'package:sharexe/domain/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTodosUseCase extends UseCaseWithoutParams<List<Todo>> {
  GetTodosUseCase(this._repository);
  final TodoRepository _repository;

  @override
  Future<Result<List<Todo>>> call() async {
    return await _repository.getTodos();
  }
}
