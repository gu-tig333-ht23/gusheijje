import 'package:flutter/material.dart';
import 'todo.dart';

class TodoListProvider extends ChangeNotifier {
  List<Todo> _items = <Todo>[
    Todo('Gör något'),
    Todo('gör något mer'),
    Todo('Nåt som jag aldrig kommer att göra'),
    Todo("Köpa matvaror för veckan"),
    Todo("Gå till gymmet och träna i 45 minuter"),
    Todo("Skriva och skicka ett viktigt arbetsmejl"),
    Todo("Städa sovrummet och organisera garderoben"),
    Todo("Betala räkningarna för den här månaden"),
    Todo("Läsa 30 sidor i den nya boken du börjat på"),
    Todo("Ring tandläkaren och boka en årlig kontroll"),
    Todo("Planera nästa semester och jämföra priserna på flygbiljetter"),
    Todo("Förbereda en måltid för att ta med till jobbet i morgon"),
    Todo("Måla om vardagsrummets väggar och köpa färgen")
  ];

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  List<Todo> get items => _items;

  GlobalKey<AnimatedListState> get key => _key;

  String _todoFilter = 'all';

  String get todoFilter => _todoFilter;

  set todoFilter(String item) {
    _todoFilter = item;
    notifyListeners();
  }

  void addItem(String name) {
    _items.insert(0, Todo(name));
    _key.currentState!.insertItem(
      0,
      duration: const Duration(seconds: 1),
    );
  }

  void removeItem(int index) {
    _key.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            child: ListTile(
              title: Text(
                'Deleted',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 300),
    );
    _items.removeAt(index);
    notifyListeners();
  }

  void toggleTodoCompletion(int index) {
    if (index >= 0 && index < _items.length) {
      _items[index].isChecked = !_items[index].isChecked;
      notifyListeners();
    }
  }
}
