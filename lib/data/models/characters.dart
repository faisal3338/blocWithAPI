class Character {
    late int charId;
    late String name;
    late String species;
    late String gender;
    late List<dynamic> origin;
    late String status;
    late String image;

Character.fromJson(Map<String, dynamic> json){
    charId = json["id"];//
    name = json["name"];//
    species = json["species"];//
    gender = json["gender"];//
    origin = json["origin"];//
    status = json["status"];//
    image = json['image'];//
}
}