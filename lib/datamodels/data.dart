import 'recipes.dart';
import 'category.dart';

class AppData {
  static List<Recipes> productList = [
    Recipes(
        id: 1,
        name: 'Egusi Soup',
        time: 'Ready in 40mins',
        isSelected: true,
        isliked: false,
        image: 'assets/foodimages/food4.png',
        category: "Trending Now"),
         Recipes(
        id: 4,
        name: 'Natural Spices',
        time: 'Ready in 20mins',
        isliked: false,
        image: 'assets/foodimages/food7.jpg',
        category: "Trending Now"),
    Recipes(
        id: 2,
        name: 'Fried Rice',
        time: 'Ready in 30mins',
        isliked: false,
        image: 'assets/foodimages/food5.png',
        category: "Trending Now"),

    Recipes(
        id: 3,
        name: 'Meat',
        time: 'Ready in 25mins',
        isliked: false,
        image: 'assets/foodimages/food6.jpg',
        category: "Trending Now"),
        Recipes(
        id: 2,
        name: 'Fried Rice',
        time: 'Ready in 30mins',
        isliked: false,
        image: 'assets/foodimages/food5.png',
        category: "Trending Now"),
    Recipes(
        id: 4,
        name: 'Natural Spices',
        time: 'Ready in 20mins',
        isliked: false,
        image: 'assets/foodimages/food7.jpg',
        category: "Trending Now"),
  ];

  static List<Recipes> cartList = [
   Recipes(
        id: 1,
        name: 'Egusi Soup',
        time: '40mins Ready',
        isSelected: true,
        isliked: false,
        image: 'assets/foodimages/food4.png',
        category: "Trending Now"),
    Recipes(
        id: 2,
        name: 'Fried Rice',
        time: '10mins Ready',
        isliked: false,
        image: 'assets/foodimages/food5.png',
        category: "Trending Now"),
    Recipes(
        id: 3,
        name: 'Meat',
        time: '20mins Ready',
        isliked: false,
        image: 'assets/foodimages/food6.jpg',
        category: "Trending Now"),
   Recipes(
        id: 4,
        name: 'Natural Spices',
        time: '45mins Ready',
        isliked: false,
        image: 'assets/foodimages/food7.jpg',
        category: "Trending Now"),
    Recipes(
        id: 1,
        name: 'Egusi Soup',
        time: '40mins Ready',
        isSelected: true,
        isliked: false,
        image: 'assets/foodimages/food4.png',
        category: "Trending Now"),
  ];
  static List<Category> categoryList = [
    Category(
        id: 1,
        name: "Meat",
        image: 'assets/foodimages/meat.jpg',
        isSelected: true),
    Category(
        id: 2,
        name: "Natural Drink",
        image: 'assets/foodimages/naturaldrink.jpg'),
    Category(
        id: 3, name: "Vegetables", image: 'assets/foodimages/vegetatables.jpg'),
    Category(id: 1, name: "International", image: 'assets/foodimages/drinks.jpg'),
    Category(id: 2, name: "Africa", image: 'assets/foodimages/meat.jpg'),
  ];

  static List<String> showThumbnailList = [
    // "assets/shoe_thumb_5.png",
    // "assets/shoe_thumb_1.png",
    // "assets/shoe_thumb_4.png",
    // "assets/shoe_thumb_3.png",
  ];
  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
 
 static String ingredient = "3 lbs Chicken Wings \n1/2 Cup Shallot, finely diced \n1 Tbsp Garlic, minced \n1 tsp Ginger, grated or minced \n1 Tbsp Black pepper, coarsley ground \n1/4 Cup Sweet Black Soy \n1/4 Cup Low Sodium Soy \n2 Tbsp Oyster Sauce \n1 Tbsp Sriracha (optional) \n2 Tbsp Brown Sugar/ Honey \n2 Tbs Oil \n2-3 green onions, sliced (for garnish)";

static String instruction = "- Preheat the oven to 425°F. Place a large wire rack on a baking sheet and coat with cooking spray.\n \n- Arrange the chicken skin side up on the rack on the baking sheet.\n \n- Brush with a little oil and roast for 20-25 minutes until the chicken is cooked, crisp up the skin by setting them under the broiler for 5-8 minutes watching them closely.\n \n- Meanwhile while the chicken is cooking, heat a tiny bit of oil on a sauce pan and add the finely diced shallots and saute for 2-3 minutes until they soften.\n \n- Add the minced garlic and ginger and fry for another minute or 2 until fragrant.\n \n- Add the black pepper, both types of Soy, oyster sauce, sriracha (optional) and brown sugar (you can use honey instead) to the sauce pan and stir well.\n \n- Let the sauce simmer and reduce to a thick syrupy consistency and then turn off the heat.\n \n- Once the wings are cooked and crispy, transfer them to a big bowl and pour the sauce over it, tossing to coat them.\n \n- Garnish with sliced green onions and enjoy while hot.";
}
