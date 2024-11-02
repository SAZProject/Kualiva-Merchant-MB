class OutletDataset {
  static List<String> get outletTags => [
        ...outletSubCategFood,
        ...outletSubCategBvg,
      ];

  static List<String> get outletType => [
        "F&B",
        "Hostelry",
        "Groceries",
        "Lounge",
        "Spa",
        "Mall",
        "Recreation",
      ];

  static List<String> get outletMainCateg => [
        "24 Hour",
        "Vegetarian",
        "Seafood",
        "Halal",
        "Shabu",
        "Grill",
        "All You Can Eat",
        "Michelin",
        "Vegan",
        "Drive Thru",
      ];

  static List<String> get outletSubCategFood => [
        "Indonesian",
        "Korean",
        "Italian",
        "Japanese",
        "Indian",
        "Chinese",
        "Malaysian",
        "Thailand",
        "Philipines",
        "Western",
        "Middle Eastern",
        "Healthy & Dietary",
        "Martabak",
        "Fast Food",
        "Bakery & Pastry",
        "Street Food",
        "Snack",
        "Dessert",
        "Fusion",
        "Beverages",
      ];

  static List<String> get outletSubCategBvg => [
        "Coffee & Tea",
        "Dairy",
        "Juice & Smoothie",
        "Soft Drink",
        "Herbal",
        "Alcohol",
        "Blend",
      ];
}
