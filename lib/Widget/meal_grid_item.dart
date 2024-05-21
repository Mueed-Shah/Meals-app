import 'package:flutter/material.dart';
import 'package:meal/Category/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meal/Widget/meta_data.dart';

class MealGridItem extends StatelessWidget {
  const MealGridItem({super.key, required this.meal,required this.onSelectMeal});
  final Meal meal;
  final Function(Meal selectedMeal) onSelectMeal;

  // to get first alphabet capital
  String get complexityText{
    return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1);
  }
  // to get first alphabet capital
  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase()+meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      elevation: 2,
      clipBehavior: Clip.hardEdge,

      child: InkWell(
        onTap: (){onSelectMeal(meal);},

        child: Stack(
          
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
              height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MetaDataWidget(title: '${meal.duration} min',icon: Icons.timelapse,),
                          const SizedBox(width: 5,),
                          MetaDataWidget(title: complexityText, icon: Icons.woman),
                          const SizedBox(width: 5,),
                          MetaDataWidget(title: affordabilityText, icon: Icons.money)
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
