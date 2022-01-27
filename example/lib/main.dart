import 'package:native_context_menu/native_context_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String? action;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ContextMenuRegion(
          onDismissed: () => setState(() => action = 'Menu was dismissed'),
          onItemSelected: (item) => setState(() {
            action = '${(item as MenuAction).title} was selected';
          }),
          menuItems: [
            MenuAction(title: 'First item'),
            MenuAction(title: 'Second item'),
            Submenu(
              title: 'Third item with submenu',
              items: [
                MenuAction(title: 'First subitem'),
                MenuAction(title: 'Second subitem'),
                MenuAction(title: 'Third subitem'),
              ],
            ),
            MenuDivider(),
            MenuAction(title: 'Fourth item'),
          ],
          child: Card(
            child: Center(
              child: Text(action ?? 'Right click me'),
            ),
          ),
        ),
      ),
    );
  }
}
