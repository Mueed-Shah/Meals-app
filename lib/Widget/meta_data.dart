import 'package:flutter/material.dart';
class MetaDataWidget extends StatelessWidget{
  const MetaDataWidget({super.key,required this.title,required this.icon}
      );
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 17,color: Colors.white,),
        const SizedBox(width: 4,),
        Text(title,style: const TextStyle(color: Colors.white,
        fontSize: 12),)
      ],
    );
  }
}