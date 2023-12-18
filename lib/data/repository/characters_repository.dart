
import 'package:flutter_application_11/data/models/characters.dart';
import 'package:flutter_application_11/data/web_services/characters_web_service.dart';
class CharactorsRepository {
  final CharacterWebService characterWebService;

  CharactorsRepository(this.characterWebService);

  Future <List<Character>> getAllCharacters() async {
    final characters = await characterWebService.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}