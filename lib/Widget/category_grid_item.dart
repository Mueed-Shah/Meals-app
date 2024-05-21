import 'package:flutter/material.dart';
import 'package:meal/Category/category.dart';
class CategoryGridItem extends StatelessWidget{
  const CategoryGridItem({required this.category,required this.onSelectCategoryScreen,super.key});
  final Category category;
  final void Function() onSelectCategoryScreen;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategoryScreen ,
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration:  BoxDecoration(

          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
          colors: [
          category.color.withOpacity(0.5),
            category.color.withOpacity(0.7),
      ],
            begin: Alignment.topLeft,
              end: Alignment.bottomRight
      )),
        child:Text(category.title,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Colors.white
        ),)
      ),
    )
      ;
  }
}
