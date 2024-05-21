import 'package:flutter/material.dart';
// import 'package:shopping_list/data/dummy_items.dart';
import 'package:shoping_list/widgets/new_item.dart';
import 'package:shoping_list/models/grocery_item.dart';

class GroceriesList extends StatefulWidget {
  const GroceriesList({super.key});

  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  final List<GroceryItem> groceryList = [];
  void _newItem() async {
    final item = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NewItem(),
    ));
    if (item == null) {
      return;
    }

    setState(() {
      groceryList.add(item);
    });
  }

  // Widget content = const Center(
  //   child: Text('No available groceries kindly add some'),
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _newItem, icon: const Icon(Icons.add))],
      ),
      body: groceryList.isEmpty
          ? const Center(
              child: Text('No available groceries kindly add some'),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                final item = groceryList[index];
                return Dismissible(
                  key: Key(item.name),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    setState(() {
                      groceryList.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Item removed'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            setState(() {
                              groceryList.insert(index, item);
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Container(
                      width: 24,
                      height: 24,
                      color: groceryList[index].category.color,
                    ),
                    title: Text(groceryList[index].name),
                    trailing: Text(groceryList[index].quantity.toString()),
                  ),
                );
              },
              itemCount: groceryList.length,
            ),
    );
  }
}