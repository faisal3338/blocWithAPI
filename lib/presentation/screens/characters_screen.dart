
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/characters_cubit.dart';
import '../../data/models/characters.dart';
import '../widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}
class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
@override
  void initState() {
    super.initState();
    //1- UI is ordered data from cubit
    //2- cubit say ok
    //3- blocprovider will be working than wake up the bloc
    //4- cubit get data from repository
    //5-repository get data from web service
    //6- web service get data from dio "API"
    allCharacters = BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget(){
    return BlocBuilder<CharactersCubit, CharactersState>(
      //state = characters state
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return buildLoadedListWidgets();
        } else{
          return showLoadingIndicator();
        }
      },
    );
  }
  
  Widget showLoadingIndicator(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        child: Column(children: [
          buildCharactersList(), //list as gridview
        ]),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
itemBuilder: (ctx, index){
  return CharacterItem(character: allCharacters[index],); //this for desgine the item in the screen 
},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Characters"),
      ),
      body: buildBlocWidget(),

    );
  }
}
