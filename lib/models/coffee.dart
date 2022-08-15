class Coffee {
  List<Coffees>? coffees;

  Coffee({this.coffees});
  Coffee.errorFetch(){throw('Error');}
  Coffee.fromJson(Map<String, dynamic> json) {
    if (json["coffees"]!= null) {
      coffees = <Coffees>[];
      json["coffees"].forEach((v) {
        coffees!.add( Coffees.fromJson(v));
      });
    }else{
      coffees=[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (coffees != null) {
      data['coffees'] = coffees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coffees {
  String? title;
  String? description;
  List<String>? ingredients;
  String? image;
  int? id;

  Coffees(
      {this.title, this.description, this.ingredients, this.image, this.id});

  Coffees.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    ingredients = json['ingredients'].cast<String>();
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['description'] = description;
    data['ingredients'] = ingredients;
    data['image'] = image;
    data['id'] = id;
    return data;
  }
}