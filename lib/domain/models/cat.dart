import 'dart:convert';

class Cat with Images{
    final String id;
    final String name;
    final String origin;
    final String description;
    final String lifeSpan;
    final int adaptability;
    final int intelligence;

    Cat({
        required this.id,
        required this.name,
        required this.origin,
        required this.description,
        required this.lifeSpan,
        required this.adaptability,
        required this.intelligence,
    });

    factory Cat.fromJson(String str) => Cat.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cat.fromMap(Map<String, dynamic> json) => Cat(
        id: json["id"],
        name: json["name"],
        origin: json["origin"],
        description: json["description"],
        lifeSpan: json["life_span"],
        adaptability: json["adaptability"],
        intelligence: json["intelligence"],
    );
    
    factory Cat.empty() => Cat(
        id: "",
        name: "",
        origin: "",
        description: "",
        lifeSpan: "",
        adaptability: 0,
        intelligence: 0,
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "origin": origin,
        "description": description,
        "life_span": lifeSpan,
        "adaptability": adaptability,
        "intelligence": intelligence,
        "image": image,
    };
}

//This mixin is used to respect the SOLID principles specifically the Open/closed 
//and is used to insert the image to an instance of the cat class without modify this
mixin Images {
    String? image;

  void setImage( String image ){
    this.image = image;
  }

}



