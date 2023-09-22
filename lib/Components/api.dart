//This file handles the communication with the api

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'todo.dart';

Future<List<Todo>> getListFromAPI() async {
  final url = 'https://todoapp-api.apps.k8s.gu.se';

  try {
    final response = await http.get(
      Uri.parse('$url/todos?key=97d91d24-f09e-4664-90d7-3dcb3746dca0'),
    );
    if (response.statusCode == 200) {
      print('Got todos successfully. Response: ${response.body}');
      return updateList(response);
    } else {
      print('Failed to get todos. Error: ${response.statusCode}');
      return [];
    }
  } catch (error) {
    print('Error: $error');

    return [];
  }
}

Future<List<Todo>> removeItem(String id) async {
  final url =
      'https://todoapp-api.apps.k8s.gu.se/todos/$id?key=97d91d24-f09e-4664-90d7-3dcb3746dca0';

  try {
    print(id);
    final response = await http.delete(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      print('deleted todo successfully. Response: ${response.body}');
      return updateList(response);
    } else {
      print('Failed to delete todo. Error: ${response.statusCode}');

      return [];
    }
  } catch (error) {
    print('Error: $error');

    return [];
  }
}

Future<List<Todo>> addTodo(String name) async {
  final todo = {
    'title': name,
  };

  final url =
      'https://todoapp-api.apps.k8s.gu.se/todos?key=97d91d24-f09e-4664-90d7-3dcb3746dca0';
  final headers = {'Content-Type': 'application/json'};
  final todoJson = jsonEncode(todo);

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: todoJson,
    );
    if (response.statusCode == 200) {
      print('Added todo successfully. Response: ${response.body}');

      return updateList(response);
    } else {
      print('Failed to add todo. Error: ${response.statusCode}');

      return [];
    }
  } catch (error) {
    print('Error: $error');

    return [];
  }
}

Future<List<Todo>> toggleTodoCompletion(Todo todo) async {
  final id = todo.id;

  final url =
      'https://todoapp-api.apps.k8s.gu.se/todos/$id?key=97d91d24-f09e-4664-90d7-3dcb3746dca0';
  final headers = {'Content-Type': 'application/json'};
  final todoToToggle = jsonEncode({
    'title': todo.title,
    'done': todo.done,
  });

  try {
    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: todoToToggle,
    );
    if (response.statusCode == 200) {
      print('toggled todo successfully. Response: ${response.body}');
      return updateList(response);
    } else {
      print('Failed to toggle todo. Error: ${response.statusCode}');

      return [];
    }
  } catch (error) {
    print('Error: $error');

    return [];
  }
}

List<Todo> updateList(response) {
  List<Todo> todos = jsonParser(jsonDecode(response.body));
  return todos;
}

List<Todo> jsonParser(dynamic response) {
  try {
    if (response is List) {
      return response.map((json) => Todo.fromJson(json)).toList();
    } else {
      print('Invalid JSON response format');
      return [];
    }
  } catch (error) {
    print('Error parsing JSON: $error');
    return [];
  }
}