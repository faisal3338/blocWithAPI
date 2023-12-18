import 'package:bloc/bloc.dart';
import 'package:flutter_application_11/data/models/characters.dart';
import 'package:flutter_application_11/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactorsRepository charactersRepository;
 List <Character> characters = [];

  
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

List<Character> getAllCharacters() {
charactersRepository.getAllCharacters().then((character) {
emit(CharactersLoaded(characters));
this.characters = character;
});
return characters;
}

}
