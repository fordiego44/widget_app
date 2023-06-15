import 'package:flutter/material.dart';
import 'package:widgets_app/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: appMenuitems.length,
        itemBuilder: (BuildContext context, index) {
          final menuItem = appMenuitems[index];
          return _CustomListTile(menuItem: menuItem);
        });
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({ 
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap:(){

      },
    );
  }
}
