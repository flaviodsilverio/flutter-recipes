class Filter {
  final FilterType type;

  bool value;

  Filter({this.type, this.value});

  String name() {
    switch (type) {
      case FilterType.vegan:
        return "Vegan";
      case FilterType.vegetarian:
        return "Vegetarian";
      case FilterType.glutenFree:
        return "Gluten-Free";
      case FilterType.dairyFree:
        return "Dairy-Free";
    }
    return "";
  }

  String description() {
    return "Include only " + name() + " meals";
  }
}

enum FilterType { vegan, vegetarian, glutenFree, dairyFree }
