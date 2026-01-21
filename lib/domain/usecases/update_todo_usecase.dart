import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/core/usecase/usecase.dart';
import 'package:sharexe/domain/entities/todo.dart';
import 'package:sharexe/domain/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateTodoUseCase extends UseCase<Todo, Todo> {
  UpdateTodoUseCase(this._repository);
  final TodoRepository _repository;

  @override
  Future<Result<Todo>> call(Todo todo) async {
    return await _repository.updateTodo(todo);
  }
}
