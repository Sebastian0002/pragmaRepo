import 'dart:convert';

class Cat {
    final String id;
    final String name;
    final String origin;
    final String description;
    final String lifeSpan;
    final int adaptability;
    final int intelligence;
    final String? image;

    Cat({
        required this.id,
        required this.name,
        required this.origin,
        required this.description,
        required this.lifeSpan,
        required this.adaptability,
        required this.intelligence,
        required this.image,
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
        image: json["image"],
    );
    
    factory Cat.empty() => Cat(
        id: "",
        name: "",
        origin: "",
        description: "",
        lifeSpan: "",
        adaptability: 0,
        intelligence: 0,
        image: null,
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
