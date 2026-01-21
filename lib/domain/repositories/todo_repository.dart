import 'package:sharexe/core/result/result.dart';
import 'package:sharexe/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<Result<List<Todo>>> getTodos();
  Future<Result<Todo>> getTodoById(int id);
  Future<Result<Todo>> createTodo(Todo todo);
  Future<Result<Todo>> updateTodo(Todo todo);
  Future<Result<void>> deleteTodo(int id);
}
