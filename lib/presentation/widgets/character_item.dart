import 'package:flutter/material.dart';
import 'package:flutter_application_11/constants/mycolor.dart';
import 'package:flutter_application_11/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: myColor.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
          color: myColor.accentColor,
          child: character.image.isNotEmpty ?
          FadeInImage.assetNetwork(
            width: double.infinity,
            height: double.infinity,
          placeholder: 'images/loading.gif',  
           image: character.image,
           fit: BoxFit.cover,
           ):Image.asset('images/wifi.png'),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black45,
          alignment: Alignment.bottomCenter,
          child: Text(
            '$character.name',
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: myColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,//if text is too long it will be cut as Computer Prog.....
            maxLines: 2,
          ),
        ),
        ),
    );
  }
}