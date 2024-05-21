import 'package:flutter/material.dart';
import 'package:shoping_list/data/categories.dart';
// import 'package:shoping_list/models/grocery_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey= GlobalKey<FormState>();
  // final GroceryItem newCategory;
  var savedName='';
  var savedQuantity = 1;
  var savedCategory= categories[Categories.vegetables]!;
  void _saveItems(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      final url = Uri.https('flutter-prep-10a1f-default-rtdb.firebaseio.com','shopping-list.json');
      http.post(url,headers: {
        'Content-Type': 'application/json'
      },
        body: jsonEncode({
          'name': savedName,
          'quantity': savedQuantity,
          'category': savedCategory.title
        }
        )
      );


      // Navigator.of(context).pop<GroceryItem>( GroceryItem(id: DateTime.now().toString(),
      //     name: savedName,
      //     quantity: savedQuantity,
      //     category: savedCategory));

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(label: Text('Name')),
              maxLength: 50,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1 ||
                    value.trim().length >= 50) {
                  return 'must be between 1 and 50 characters.';
                }
                return null;
              },
              onSaved: (value){
                savedName=value!;
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text('Quantity')),
                    keyboardType: TextInputType.number,
                    initialValue: '1',
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          int.tryParse(value) == null ||
                          int.tryParse(value)! <= 0) {
                        return 'Enter valid positive number';
                      }
                      return null;
                    },
                    onSaved: (value){
                      savedQuantity=int.parse(value!);
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: DropdownButtonFormField(
                      value: savedCategory,
                      items: [
                    for (final category in categories.entries)
                      DropdownMenuItem(
                          value: category.value,

                          child: Row(
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                color: category.value.color,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(category.value.title),
                            ],
                          ))
                  ], onChanged: (value) {
                    setState(() {
                      savedCategory = value!;
                    });
                  }),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              TextButton(onPressed: (){
                _formKey.currentState!.reset();
              }, child:const Text('Reset')),
              ElevatedButton(onPressed: _saveItems, child:const Text('Add Items'))
            ],)
          ]),
        ),
      ),
    );
  }
}
