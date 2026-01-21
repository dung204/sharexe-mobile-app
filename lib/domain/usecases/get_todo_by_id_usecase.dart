import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/core/usecase/usecase.dart';
import 'package:sharexe/domain/entities/todo.dart';
import 'package:sharexe/domain/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTodoByIdUseCase extends UseCase<Todo, int> {
  GetTodoByIdUseCase(this._repository);
  final TodoRepository _repository;

  @override
  Future<Result<Todo>> call(int id) async {
    return await _repository.getTodoById(id);
  }
}
