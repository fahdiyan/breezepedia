//
//  MenuDummy.swift
//  breezepedia
//
//  Created by Sabri Ramadhani on 07/04/25.
//

let dummyMenus: [String: [MenuModel]] = [
    "J.Co Coffee": [
        MenuModel(
            name: "Jcochino",
            image: "jcochino",
            description: "Double shot espresso + milk",
            price: 27000
        ),
        MenuModel(
            name: "Matcha Frappe",
            image: "greenteafrappe",
            description: "Premium matcha powder + milk, garnished with whipped cream",
            price: 35000
        ),
        MenuModel(
            name: "Strawberry Yogurt Frappe",
            image: "strawberryfrappe",
            description: "Lorem ipsum dolor sit amet",
            price: 35000
        ),
        MenuModel(
            name: "Jcoccino Frappe",
            image: "jcoccinofrappe",
            description: "Double shot espresso, blended together with ice and fresh milk",
            price: 35000
        ),
        MenuModel(
            name: "Iced Lemon Tea",
            image: "lemontea",
            description: "Cold tea infused with fresh lemon slice",
            price: 21000
        ),
        MenuModel(
            name: "Alcapon",
            image: "alcapoon",
            description: "Soft donut dough with slices of almond",
            price: 10000
        ),
        MenuModel(
            name: "Rainbow Choco",
            image: "rainbowchoco",
            description: "Soft donut dough with rainbow sprinkles on top",
            price: 10000
        ),
        MenuModel(
            name: "Choco Caviar",
            image: "caviarchoco",
            description: "Soft donut dough with small crunchy choco balls",
            price: 10000
        )
    ],
    "bebek bengil": [
        MenuModel(
            name: "Bebek Bengil Crispy Original",
            image: "bebekbengilori",
            description: "Half portion of deep-fried duck, rich in spices and flavors combined with a set of steamed rice and Balinese vegetables or sauteed potato and salad",
            price: 147500
        ),
        MenuModel(
            name: "Pelalah Crispy Duck",
            image: "bebekpela",
            description: "Chunk of duck In Balinese tomato sauce served with sweet potato rice",
            price: 143500
        ),
        MenuModel(
            name: "Grilled Duck with Green Chili",
            image: "sambalhijau",
            description: "Served with sweet potato rice and vegetables",
            price: 143500
        ),
        MenuModel(
            name: "Duck Fried Rice",
            image: "duckfriedrice",
            description: "Delicious fried rice with crispy duck",
            price: 93500
        ),
        MenuModel(
            name: "Crispy Duck Salad",
            image: "crispyducksalad",
            description: "Duck salad with traditional balinese dressing",
            price: 104500
        ),
        MenuModel(
            name: "Fresh Grilled Seafood",
            image: "seafoodgrilled",
            description: "Prawn, squid and snapper served with garlic butter and chili sauce",
            price: 139000
        ),
        MenuModel(
            name: "Tomyam goong",
            image: "tomyam",
            description: "Spicy Thai shrimp and mushroom soup with lemon grass",
            price: 88000
        ),
        MenuModel(
            name: "Chicken Soup",
            image: "supayam",
            description: "Delicious soup with shredded chicken",
            price: 60500
        )
    ],
    "Burgreens": [
        MenuModel(
            name: "Crispy Chicken Burger",
            image: "crispychicken",
            description: "Thic burger with crispy spicy chicken",
            price: 59000
        ),
        MenuModel(
            name: "Beefless Cheeze Burger",
            image: "beeflesscheeze",
            description: "Plant - based bee fless minced patty topped with melted vegan cheeze , coleslaw salad. Sliced tomatoes and home made cucumber pickles in whole-wheat brioche bun",
            price: 65000
        ),
        MenuModel(
            name: "Mighty Mushroom Burger",
            image: "mightymushroom",
            description: "Juicy pan-grilled mushroom patty topped with lettuce, sliced tomatoes , home made cucumber pickles, sauteed onions, caesar dressing in whole-wheat briochebun",
            price: 55000
        ),
        MenuModel(
            name: "Trio Mini Burger",
            image: "minitrio",
            description: " Mini veggie burgers consisting of crispy chick'n tender, shredded beefless meat and mini mighty mushroom patty in whole-wheat briochebun",
            price: 69000
        ),
        MenuModel(
            name: "Truffle Pasta",
            image: "trufflepasta",
            description: "Combination of pasta, truffle oil,vegan cheddar, sauteed champignon mushroom,pinach and served alongside garlic sourdough bread . Delizioso!",
            price: 60000
        ),
        MenuModel(
            name: "Kung Pao",
            image: "kungpao",
            description: "Chinese-style organic tofu, onion, served with organic brown rice a n d organic greens",
            price: 55000
        ),
        MenuModel(
            name: "Asian Platter",
            image: "asianplatter",
            description: "Set of meat, chicken grill with vegetable topping",
            price: 25000
        ),
        MenuModel(
            name: "Vegan Bimbimbap",
            image: "veganbim",
            description: "Vomes with brown rice, beefless bulgogi. steamed veggies, vegan kimchi and a special gochujang sauce",
            price: 59000
        )
    ],
    "Boost Juice": [
        MenuModel(
            name: "5 A Day Fit (Premium)",
            image: "adayfit",
            description: "Freshly squeezed orange, apple, carrot, celery, beetroot & ice + vita booster",
            price: 75000
        ),
        MenuModel(
            name: "Energiser Juice (Premium)",
            image: "adayfit",
            description: "Freshly squeezed orange, banana, strawberries & ice + energiser booster",
            price: 55000
        ),
        MenuModel(
            name: "Lean and Green (Premium)",
            image: "leangreen",
            description: "Freshly juiced apple, celery, mint, cucumber & ice + wheat grass booster",
            price: 75000
        ),
        MenuModel(
            name: "Wild Berry Juice (Premium)",
            image: "wildberry",
            description: "Freshly juiced pineapple, apple, raspberries, strawberries, blueberries & ice + energiser booster",
            price: 75000
        ),
        MenuModel(
            name: "Strawbrekkie Protein",
            image: "strawbrekkie",
            description: "Banana, blueberries, strawberries, oats, whey protein, apple juice, TD4 strawberry yoghurt & ice + energiser booster",
            price: 55000
        ),
        MenuModel(
            name: "Superfruit Energy",
            image: "superfruit",
            description: "Raspberries, blueberries, apple juice, TD4 vanilla yoghurt, TD4 strawberry yoghurt & ice + superfruit booster + energiser booster",
            price: 59000
        ),
        MenuModel(
            name: "Protein Supreme",
            image: "proteinsupreme",
            description: "Banana, toasted muesli, whey protein, chia seeds, cinnamon, honey, coconut water, coconut milk & ice",
            price: 55000
        ),
        MenuModel(
            name: "Vita C Detox Juice",
            image: "vitac",
            description: "Freshly squeezed orange, apple, carrot, ginger & ice + vita booster",
            price: 65000
        )
    ],
    
    "Sate Senayan": [
        MenuModel(
            name: "Sate Ayam Bumbu Halus",
            image: "sateayam",
            description: "Chicken Satay with smoothed peanut sauce topping",
            price: 70000
        ),
        MenuModel(
            name: "Gurame Bakar Sambal",
            image: "guramebakar",
            description: "Freshly grilled Gurame fish, served over spicy onion sambal.",
            price: 65000
        ),
        MenuModel(
            name: "Traditional Ketoprak",
            image: "ketoprak",
            description: "Packed riced mixed with various vegetables, protein and peanut sauce.",
            price: 38000
        ),
        MenuModel(
            name: "Soto Ayam",
            image: "sotoayam",
            description: "Chicken soup with shredded chicken and vegetables.",
            price: 75000
        ),
        MenuModel(
            name: "Fried Rice Premium with Egg",
            image: "nasigoreng",
            description: "Banana, blueberries, strawberries, oats, whey protein, apple juice, TD4 strawberry yoghurt & ice + energiser booster",
            price: 20000
        ),
        MenuModel(
            name: "Jeruk Nipis Iced Tea",
            image: "esteh",
            description: "Iced tea infused with jeruk nipis and sweetened by syroup.",
            price: 18000
        ),
        MenuModel(
            name: "Package of Gorengan",
            image: "gorengan",
            description: "Fried pastel, kerupuk, cireng, srved with sambal merah.",
            price: 55000
        ),
        MenuModel(
            name: "Sweetened Coco Klepon",
            image: "klepon",
            description: "Coconut cake filled with coconut cream & sprinkled with grated coconut.",
            price: 15000
        )
    ],
    
    "Kenangan Coffee": [
        MenuModel(
            name: "Iced Kenangan Latte",
            image: "kenanganlatte",
            description: "Double shot espresso served over steamed milk with Aren sugar & ice.",
            price: 38000
        ),
        MenuModel(
            name: "Iced Gula Melaka Latte",
            image: "gulamelaka",
            description: "Double shot espresso served over steamed milk with Melaka salted cream & ice.",
            price: 45000
        ),
        MenuModel(
            name: "Uji Matcha Latte",
            image: "ujimatcha",
            description: "Premium Uji Matcha served over steamed milk, ice , and salted cream.",
            price: 40000
        ),
        MenuModel(
            name: "Iced Creamy Choco",
            image: "creamychoco",
            description: "Premium chocolate powder served over milk,ice and chocolaate topping.",
            price: 35000
        ),
        MenuModel(
            name: "Iced Gula Melaka Frappe",
            image: "gulamelakafrappe",
            description: "Blended ice with double shot espresso, served over steamed milk with Melaka salted cream & ice.",
            price: 45000
        ),
        MenuModel(
            name: "Ice Nutella Temptation",
            image: "nutellafrappe",
            description: "Blended ice with double shot espresso, Nutella, steamed milk and whipped cream.",
            price: 38000
        ),
        MenuModel(
            name: "Hot Cappucino",
            image: "cappucino",
            description: "Double shot espresso served over hot steamed milk.",
            price: 28000
        ),
        MenuModel(
            name: "Egg Cronigiry",
            image: "eggconigiry",
            description: "Freshly baked inigiry-shaped croissant filled with egg custard.",
            price: 20000
        )
    ],
    
    
    "D'Cost Seafood": [
        MenuModel(
            name: "Iced Kenangan Latte",
            image: "kenanganlatte",
            description: "Double shot espresso served over steamed milk with Aren sugar & ice.",
            price: 38000
        ),
        MenuModel(
            name: "Iced Gula Melaka Latte",
            image: "gulamelaka",
            description: "Double shot espresso served over steamed milk with Melaka salted cream & ice.",
            price: 45000
        ),
        MenuModel(
            name: "Uji Matcha Latte",
            image: "ujimatcha",
            description: "Premium Uji Matcha served over steamed milk, ice , and salted cream.",
            price: 40000
        ),
        MenuModel(
            name: "Iced Creamy Choco",
            image: "creamychoco",
            description: "Premium chocolate powder served over milk,ice and chocolaate topping.",
            price: 35000
        ),
        MenuModel(
            name: "Iced Gula Melaka Frappe",
            image: "gulamelakafrappe",
            description: "Blended ice with double shot espresso, served over steamed milk with Melaka salted cream & ice.",
            price: 45000
        ),
        MenuModel(
            name: "Ice Nutella Temptation",
            image: "nutellafrappe",
            description: "Blended ice with double shot espresso, Nutella, steamed milk and whipped cream.",
            price: 38000
        ),
        MenuModel(
            name: "Hot Cappucino",
            image: "cappucino",
            description: "Double shot espresso served over hot steamed milk.",
            price: 28000
        ),
        MenuModel(
            name: "Egg Cronigiry",
            image: "eggconigiry",
            description: "Freshly baked inigiry-shaped croissant filled with egg custard.",
            price: 20000
        )
    ],
    
    "Chaterise": [
        MenuModel(
            name: "Legendary Fresh Cream Cake",
            image: "legendcream",
            description: "Strawberry shortcake with whipped cream and fresh strawberry on top.",
            price: 45000
        ),
        MenuModel(
            name: "Fresh Cream Chocolate",
            image: "freshcreamchoco",
            description: "Chocolate cake with choco whipped cream and fresh strawberry on top.",
            price: 49000
        ),
        MenuModel(
            name: "Rare Blueberry Cheesecake",
            image: "blueberrycake",
            description: "Fresh & soft blueberry cheesecake with fresh blueberry on top.",
            price: 50000
        ),
        MenuModel(
            name: "Iced Creamy Choco",
            image: "creamychoco",
            description: "Premium chocolate powder served over milk,ice and chocolate topping.",
            price: 35000
        ),
        MenuModel(
            name: "Fluffy Souffle Cake",
            image: "fluffysouffle",
            description: "Freshly baked soft and tender souffle cake.",
            price: 35000
        ),
        MenuModel(
            name: "Uji Matcha Mile Crepe",
            image: "ujimatcha",
            description: "Mile Crepe with Uji Matcha cream and powder.",
            price: 48000
        ),
        MenuModel(
            name: "White Zebra",
            image: "whitezebra",
            description: "Layered crepe cake, served with creme brule on top of the layer.",
            price: 69000
        ),
        MenuModel(
            name: "Roll Brulee",
            image: "rollbrulee",
            description: "Freshly baked roll cake with grilled creme brulee on top.",
            price: 35000
        )
    ],
    
    "Marugame Udon": [
        MenuModel(
            name: "Beef Abura Udon",
            image: "beefabura",
            description: "Strawberry shortcake with whipped cream and fresh strawberry on top.",
            price: 55000
        ),
        MenuModel(
            name: "Beef Curry Udon",
            image: "beefcurry",
            description: "Chocolate cake with choco whipped cream and fresh strawberry on top.",
            price: 58000
        ),
        MenuModel(
            name: "Katsu Curry Udon",
            image: "katsucurry",
            description: "Fresh & soft blueberry cheesecake with fresh blueberry on top.",
            price: 55000
        ),
        MenuModel(
            name: "Kake Udon",
            image: "kakeudon",
            description: "Premium chocolate powder served over milk,ice and chocolate topping.",
            price: 65000
        ),
        MenuModel(
            name: "Teriyaki Abura Udon",
            image: "teriyakiabura",
            description: "Freshly baked soft and tender souffle cake.",
            price: 47000
        ),
        MenuModel(
            name: "Tori Baitan Udon",
            image: "toribaitan2",
            description: "Mile Crepe with Uji Matcha cream and powder.",
            price: 40000
        ),
        MenuModel(
            name: "Spicy Tori Baitan Udon",
            image: "toribairan",
            description: "Layered crepe cake, served with creme brule on top of the layer.",
            price: 55000
        ),
        MenuModel(
            name: "Niku Zaru Udon",
            image: "nikuzaru",
            description: "Freshly baked roll cake with grilled creme brulee on top.",
            price: 40000
        )
    
    ],
    
    
    
    
]
