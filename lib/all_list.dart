List<String> foodCategories = [
  "All",
  "Burger",
  "Tacos",
  "Sandwich",
  "Fries",
  "Croissant",
  "Pizza",
  "Twister",
  "Noodles",
  "Donut",
  "Desert"
];

List<Map<String, String>> promoCodes = [
  {
    "name": "FOOD0221",
    "code": "X45F3556",
    "description": "You Will Get 2\$ Discount Lorem ipsum dolor sit amet consectetur. Lorem ipsum dolor sit amet consectetur. Finibus fugiat nulla",
    "discount": "2.00"
  },
  {
    "name": "BUGX1247",
    "code": "Q97K5232",
    "description": "You Will Get 3\$ Discount Lorem ipsum dolor sit amet consectetur. Finibus fugiat nulla",
    "discount": "3.00"
  },
  {
    "name": "NEWU1874",
    "code": "Z64N8465",
    "description": "You Will Get 1\$ Discount Lorem ipsum dolor sit amet consectetur",
    "discount": "1.00"
  },
  {
    "name": "PIZZ1654",
    "code": "P64G7986",
    "description": "You Will Get 5\$ Discount",
    "discount": "5.00"
  },
  {
    "name": "TWIZ4895",
    "code": "T84V4658",
    "description": "You Will Get 4\$ Discount",
    "discount": "4.00"
  }
];

List ingredient = [
  "onion",
  "broccoli",
  "carrot",
  "cheese",
  "capcicum",
  "cucumber",
  "olives",
  "redchilli",
  "tomato"
];

List<Map<String, dynamic>> foodItems = [
  {
    "name": "Veggie Burger",
    "subName": "Classic Burger",
    "shortDescription": "Delicious classic veggie burger with fresh ingredients.",
    "detailedDescription": "Indulge in the classic taste of our Veggie Burger featuring a flavorful vegetarian patty, crisp lettuce, juicy tomatoes, onions, and melted cheese. Served on a soft bun with a side of golden fries. A perfect choice for a satisfying and meat-free meal.",
    "category": "Burger",
    "price": 4.99,
    "calories": 400,
    "timeToMake": 15,
    "rating": 4.5,
    "ingredients": ["vegetarian_patty", "lettuce", "tomato", "onion", "cheese"],
    "imageUrl": "https://example.com/veggie-burger-image.jpg"
  },
  {
    "name": "Spicy Chickpea Burger",
    "subName": "Spicy",
    "shortDescription": "Spicy chickpea burger with zesty toppings for a flavorful kick.",
    "detailedDescription": "Experience the bold flavors of our Spicy Chickpea Burger. A mouthwatering blend of chickpea patty infused with spices, topped with zesty salsa, creamy avocado, and crunchy lettuce. A spicy delight for burger enthusiasts.",
    "category": "Burger",
    "price": 5.49,
    "calories": 350,
    "timeToMake": 20,
    "rating": 4.2,
    "ingredients": ["chickpea_patty", "salsa", "avocado", "lettuce", "spices"],
    "imageUrl": "replace_with_actual_google_image_url"
  },
  {
    "name": "Mushroom Swiss Burger",
    "subName": "Swiss",
    "shortDescription": "Savory mushroom Swiss burger with melted cheese and rich flavors.",
    "detailedDescription": "Indulge in the richness of our Mushroom Swiss Burger. A succulent mushroom-infused patty topped with melted Swiss cheese, sautéed mushrooms, and a drizzle of savory sauce. A gourmet experience for burger connoisseurs.",
    "category": "Burger",
    "price": 6.99,
    "calories": 420,
    "timeToMake": 18,
    "rating": 4.7,
    "ingredients": ["mushroom_patty", "swiss_cheese", "sauteed mushrooms", "sauce", "brioche_bun"],
    "imageUrl": "replace_with_actual_google_image_url"
  },
  {
    "name": "Beyond Burger",
    "subName": "Beyond",
    "shortDescription": "Beyond Burger with plant-based patty for a guilt-free delight.",
    "detailedDescription": "Delight in the guilt-free indulgence of our Beyond Burger. Featuring a plant-based patty that looks, cooks, and satisfies like beef. Topped with fresh lettuce, tomato, and vegan cheese. A delicious choice for conscious eaters.",
    "category": "Burger",
    "price": 7.99,
    "calories": 380,
    "timeToMake": 15,
    "rating": 4.4,
    "ingredients": ["beyond_patty", "lettuce", "tomato", "vegan_cheese", "whole_wheat_bun"],
    "imageUrl": "replace_with_actual_google_image_url"
  },
  {
    "name": "Avocado Ranch Burger",
    "subName": "Avocado",
    "shortDescription": "Avocado ranch burger with creamy toppings for a refreshing taste.",
    "detailedDescription": "Savor the refreshing taste of our Avocado Ranch Burger. A juicy burger topped with creamy avocado slices, crisp lettuce, and drizzled with zesty ranch dressing. A perfect blend of flavors for a delightful meal.",
    "category": "Burger",
    "price": 8.49,
    "calories": 350,
    "timeToMake": 22,
    "rating": 4.6,
    "ingredients": ["beef_patty", "avocado", "lettuce", "tomato", "ranch_dressing"],
    "imageUrl": "replace_with_actual_google_image_url"
  },
  {
    "name": "Mushroom Tacos",
    "subName": "Spicy Tacos",
    "shortDescription": "Spicy mushroom-filled tacos with salsa and creamy avocado.",
    "detailedDescription": "Experience the bold flavors of our Spicy Mushroom Tacos. Sautéed mushrooms combined with zesty salsa, creamy avocado, and fresh cilantro, all wrapped in warm tortillas. A mouthwatering delight for taco enthusiasts.",
    "category": "Tacos",
    "price": 6.49,
    "calories": 350,
    "timeToMake": 20,
    "rating": 4.2,
    "ingredients": ["mushrooms", "salsa", "avocado", "cilantro", "lime"],
    "imageUrl": "https://example.com/mushroom-tacos-image.jpg"
  },
  {
    "name": "Caprese Sandwich",
    "subName": "Toast Sandwich ",
    "shortDescription": "Fresh Caprese sandwich with tomato, mozzarella, and basil.",
    "detailedDescription": "Savor the freshness of our Caprese Sandwich. Layers of ripe tomatoes, creamy mozzarella, and fragrant basil, drizzled with olive oil, all nestled between slices of artisanal bread. A delightful choice for a light and tasty meal.",
    "category": "Sandwich",
    "price": 7.99,
    "calories": 300,
    "timeToMake": 10,
    "rating": 4.7,
    "ingredients": ["tomato", "mozzarella", "basil", "olive_oil", "bread"],
    "imageUrl": "https://example.com/caprese-sandwich-image.jpg"
  },
  {
    "name": "Sweet Potato Fries",
    "subName": "Crispy Fries",
    "shortDescription": "Crispy and seasoned sweet potato fries for a delightful crunch.",
    "detailedDescription": "Enjoy the irresistible crunch of our Crispy Sweet Potato Fries. Sliced sweet potatoes, seasoned to perfection, and baked until golden brown. A healthier alternative for those craving a satisfying side dish.",
    "category": "Fries",
    "price": 3.49,
    "calories": 250,
    "timeToMake": 25,
    "rating": 4.4,
    "ingredients": ["sweet_potatoes", "olive_oil", "paprika", "salt", "garlic_powder"],
    "imageUrl": "https://example.com/sweet-potato-fries-image.jpg"
  },
  {
    "name": "Spinach Croissant",
    "subName": "Flaky Croissant",
    "shortDescription": "Flaky croissant filled with savory spinach and feta cheese.",
    "detailedDescription": "Indulge in the rich flavors of our Flaky Spinach Croissant. Layers of buttery, flaky pastry enveloping a savory filling of spinach and tangy feta cheese. A perfect choice for a delightful breakfast or snack.",
    "category": "Croissant",
    "price": 5.99,
    "calories": 320,
    "timeToMake": 30,
    "rating": 4.6,
    "ingredients": ["spinach", "feta_cheese", "butter", "flour", "salt"],
    "imageUrl": "https://example.com/spinach-croissant-image.jpg"
  },
  {
    "name": "Margherita Pizza",
    "subName": "Classic",
    "shortDescription": "Classic Margherita pizza with fresh tomatoes and mozzarella.",
    "detailedDescription": "Indulge in the timeless taste of our Margherita Pizza. Featuring a thin crust topped with flavorful tomato sauce, fresh tomatoes, and gooey mozzarella. Each bite is a burst of authentic Italian flavors that will leave you craving for more.",
    "category": "Pizza",
    "price": 8.99,
    "calories": 450,
    "timeToMake": 18,
    "rating": 4.8,
    "ingredients": ["tomato_sauce", "mozzarella_cheese", "tomatoes", "basil", "olive_oil"],
    "imageUrl": "https://example.com/margherita-pizza-image.jpg"
  },
  {
    "name": "Potato Twister",
    "subName": "Seasoned",
    "shortDescription": "Seasoned spiral-cut potato twisters for a delightful crunch.",
    "detailedDescription": "Experience the crispy perfection of our Seasoned Spiral Potato Twisters. Sliced and seasoned potatoes twisted into a delightful snack. Crispy on the outside, fluffy on the inside, and perfectly seasoned for an addictive crunch.",
    "category": "Twister",
    "price": 4.29,
    "calories": 280,
    "timeToMake": 12,
    "rating": 4.3,
    "ingredients": ["potatoes", "seasonings", "vegetable_oil", "salt", "paprika"],
    "imageUrl": "https://example.com/potato-twister-image.jpg"
  },
  {
    "name": "Vegetable Noodles",
    "subName": "Stir-fried",
    "shortDescription": "Stir-fried vegetable noodles for a quick and flavorful meal.",
    "detailedDescription": "Enjoy a delightful plate of Stir-Fried Vegetable Noodles. A medley of colorful vegetables and perfectly cooked noodles, stir-fried to perfection with a savory blend of soy sauce, ginger, and garlic. A quick and satisfying meal for any occasion.",
    "category": "Noodles",
    "price": 6.79,
    "calories": 380,
    "timeToMake": 22,
    "rating": 4.5,
    "ingredients": ["noodles", "mixed_vegetables", "soy_sauce", "ginger", "garlic"],
    "imageUrl": "https://example.com/vegetable-noodles-image.jpg"
  },
  {
    "name": "Glazed Donut",
    "subName": "Sweet",
    "shortDescription": "Sweet and glazed vegan donut for guilt-free indulgence.",
    "detailedDescription": "Treat yourself to the guilt-free indulgence of our Vegan Glazed Donut. A soft and fluffy donut, generously coated with a sweet and luscious glaze. Perfect for satisfying your sweet cravings without compromising on your vegan lifestyle.",
    "category": "Donut",
    "price": 2.99,
    "calories": 200,
    "timeToMake": 15,
    "rating": 4.2,
    "ingredients": ["flour", "sugar", "almond_milk", "vegan_glaze", "baking_powder"],
    "imageUrl": "https://example.com/vegan-glazed-donut-image.jpg"
  },
  {
    "name": "Fruit Desert",
    "subName": "Refreshing",
    "shortDescription": "Refreshing fruit dessert with assorted fruits and Greek yogurt.",
    "detailedDescription": "Savor the freshness of our Refreshing Fruit Dessert. An assortment of ripe and juicy fruits topped with creamy Greek yogurt, honey, and a sprinkle of granola. A delightful and healthy way to satisfy your sweet tooth.",
    "category": "Desert",
    "price": 9.49,
    "calories": 150,
    "timeToMake": 8,
    "rating": 4.6,
    "ingredients": ["assorted_fruits", "honey", "mint_leaves", "greek_yogurt", "granola"],
    "imageUrl": "https://example.com/fruit-desert-image.jpg"
  },
];

List<Map<String, dynamic>> favouriteFoodItems = [
];
List<Map<String, dynamic>> cartFoodItems = [
];
// "name": "Veggie Burger",
// "subName": "Classic Burger",
// "shortDescription": "Delicious classic veggie burger with fresh ingredients.",
// "detailedDescription": "Indulge in the classic taste of our Veggie Burger featuring a flavorful vegetarian patty, crisp lettuce, juicy tomatoes, onions, and melted cheese. Served on a soft bun with a side of golden fries. A perfect choice for a satisfying and meat-free meal.",
// "category": "Burger",
// "price": 4.99,
// "calories": 400,
// "timeToMake": 15,
// "rating": 4.5,
// "ingredients": ["Vegetarian Patty", "Lettuce", "Tomato", "Onion", "Cheese"],
// "imageUrl": "https://example.com/veggie-burger-image.jpg"
List<Map<String,dynamic>> recentOrders=[
];