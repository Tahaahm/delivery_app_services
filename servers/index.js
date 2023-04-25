const express = require('express');
const app = express();
const recommended = {
  type_id: 11,
  offset: 0,
  products: [
    {
      id: 1,
      name: 'Crisp papadum',
      image:
        'https://images.unsplash.com/photo-1602253057119-44d745d9b860?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGlzaHxlbnwwfHwwfHw%3D&w=1000&q=80',
      description: 'spicy with a crisp texture',

      price: 3.89,
      descriptions:
        'beef, flesh of mature cattle, as distinguished from veal, the flesh of calves. The best beef is obtained from early maturing, special beef breeds. High-quality beef has firm, velvety, fine-grained lean, bright red in colour and well-marbled. The fat is smooth, creamy white, and well distributed',
      size: 'Normal',
      weight: '500',
      time: 18,
    },
    {
      id: 2,
      name: 'Jalebi ',
      image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbZQCOjpinny_lfbfkRkmw_0dzrnfma0NDcvnqwC7eGAra4k5tjPxxZDaBjH3oB2ce_OY&usqp=CAU',
      description: ' sweet dish served ',

      price: 2.55,
      descriptions:
        'Jalebis are Indian desserts made by deep-frying a wheat flour (maida flour) batter in pretzel or circular shapes, which are then soaked in sugar syrup. They can be served warm or cold as well. They are sweet with chewy texture and crunchy crust',
      size: 'Big',
      weight: '750',
      time: 22,
    },

    {
      id: 3,
      name: 'Chhole Bhature',
      image:
        'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=768,574',
      description: 'fried flatbreads and tangy chickpea curry',

      price: 5.44,
      descriptions:
        'It is a combination of chana masala (spicy white chickpeas) and bhatura/puri, a deep-fried bread made from maida. Although it is known as a typical Punjabi dish, It is originally a culinary dish of Delhi and Uttar Pradesh. Chole bhature is often eaten as a breakfast dish, sometimes accompanied with lass',
      size: 'Normal',
      weight: '450',
      time: 23,
    },
    {
      id: 4,
      name: 'Pindi Chana',
      image:
        'https://www.blueosa.com/wp-content/uploads/2020/07/Matar-Paneer-Peas-and-Cooked-Cottage-Cheese.jpg',
      description: 'masala has a nice balance',

      price: 4.76,
      descriptions:
        'It is named Pindi Chana after the town where it originated—Rawalpindi (Pakistan)—in the days before the India-Pakistan partition. Easy to cook, it makes for a wholesome meal when served with bread such as Kulcha or Naan and a green salad. Pindi Chana can be made with dried chickpeas too',
      size: 'Big',
      weight: '650',
      time: 21,
    },
    {
      id: 5,
      name: 'Samosa',
      image:
        'https://media.istockphoto.com/id/1053423374/photo/coconut-chicken-in-a-spicy-cream-sauce-close-up-horizontal-top-view.jpg?s=612x612&w=0&k=20&c=ROQpgzQqLsMnX4IGkrsrKJCOfz7-0P41K3nKKzgN_Pg=',
      description: 'brittle crust and soft potatoes',

      price: 3.65,
      descriptions:
        'A vegetable samosa is a savory pastry enjoyed at Indian restaurants. It can be an appetizer, snack, or entrée. The filling is made with potato, peas, chilies, ginger, and even more ingredients to amp up the flavor.',
      size: 'Normal',
      weight: '500',
      time: 15,
    },
    {
      id: 6,
      name: 'Hummas',
      image:
        'https://cdn.pixabay.com/photo/2022/06/07/20/52/curry-7249247__340.jpg',
      description: ' sweet, sour, bitter, salty and umami or savory',

      price: 5.89,
      descriptions:
        "Hummus, that creamy dip that hails from the Middle East, has a reputation as a clean, healthy food. It deserves it. All the main ingredients are super foods in their own right. It's got chickpeas, sesame paste (tahini), garlic, and olive oil in most traditional versions",
      size: 'Big',
      weight: '720',
      time: 23,
    },
    {
      id: 7,
      name: 'Masala dosa',
      image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEdrcfaHN3b6C5XXu3bmd4gcnd-YTVM1aPiA&usqp=CAU',
      description: 'slight tangy taste due to the fermentation',

      price: 4.22,
      descriptions:
        'A dosa, also called dosai, dosey, or dosha is a thin pancake in South Indian cuisine made from a fermented batter of ground black lentils and rice. Dosas are popular in South Asia as well as around the world. Dosas are served hot, often with chutney and sambar.',
      size: 'Small',
      weight: '340',
      time: 22,
    },
    {
      id: 8,
      name: 'Seafood',
      image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHCXmIJTsGP5eRb5baDpMLTtOV5GpTjPqBOy_hN1UcY2H0HUHCdSWrsnpZOBbjqSAqs1w&usqp=CAU',
      description:
        'ndescribably different about food that is harvested from the sea',

      price: 5.34,
      descriptions:
        'eafood, edible aquatic animals, excluding mammals, but including both freshwater and ocean creatures.',
      size: 'Big',
      weight: '745',
      time: 34,
    },
    {
      id: 9,
      name: 'Chichken rice',
      image:
        'https://static01.nyt.com/images/2021/12/17/t-magazine/17tmag-25-dishes-slide-0BXV/17tmag-25-dishes-slide-0BXV-mobileMasterAt3x.jpg',
      description: 'it is very aromatic and usually eaten with steam chicken',

      price: 4.1,
      descriptions:
        'The Hainanese chicken rice is a dish that consists of succulent poached white chicken cut into bite-size pieces and served on fragrant rice with some light soy sauce. The dish is topped with sprigs of coriander leaf and sesame oil, and accompanied by a garlic-chilli dip.',
      size: 'Big',
      weight: '750',
      time: 31,
    },
  ],
};

const dishes = {
  type_id: 11,
  offset: 0,
  products: [
    {
      id: 1,
      name: 'Chhole Bhature',
      image:
        'https://www.freepnglogos.com/uploads/food-png/food-grass-fed-beef-foodservice-products-grass-run-farms-4.png',
      description: 'fried flatbreads and tangy chickpea curry',
      detials: [
        {
          price: 5.44,
          descriptions:
            'It is a combination of chana masala (spicy white chickpeas) and bhatura/puri, a deep-fried bread made from maida. Although it is known as a typical Punjabi dish, It is originally a culinary dish of Delhi and Uttar Pradesh. Chole bhature is often eaten as a breakfast dish, sometimes accompanied with lass',
          size: 'Normal',
          weight: '450',
          time: 23,
        },
      ],
    },
    {
      id: 2,
      name: 'Pindi Chana',
      image:
        'https://static.cookunity.com/growth/media/landings/rebrand-meals/global-cusines/1.png',
      description: 'masala has a nice balance',
      detials: [
        {
          price: 4.76,
          descriptions:
            'It is named Pindi Chana after the town where it originated—Rawalpindi (Pakistan)—in the days before the India-Pakistan partition. Easy to cook, it makes for a wholesome meal when served with bread such as Kulcha or Naan and a green salad. Pindi Chana can be made with dried chickpeas too',
          size: 'Big',
          weight: '650',
          time: 21,
        },
      ],
    },
    {
      id: 3,
      name: 'Samosa',
      image:
        'https://cdn.yosushi.com/r/w-1000/YoSushi/files/a9/a970ef9a-bf3e-44d3-8e8d-28437370aa41.638106338390000000.png',
      description: 'brittle crust and soft potatoes',
      detials: [
        {
          price: 3.65,
          descriptions:
            'A vegetable samosa is a savory pastry enjoyed at Indian restaurants. It can be an appetizer, snack, or entrée. The filling is made with potato, peas, chilies, ginger, and even more ingredients to amp up the flavor.',
          size: 'Normal',
          weight: '500',
          time: 15,
        },
      ],
    },
    {
      id: 4,
      name: 'Hummas',
      image:
        'https://cdn.yosushi.com/r/w-1000/YoSushi/files/be/beee1e97-9865-4819-8fdb-3d3d0674bcf4.638106338180000000.png',
      description: ' sweet, sour, bitter, salty and umami or savory',
      detials: [
        {
          price: 5.89,
          descriptions:
            "Hummus, that creamy dip that hails from the Middle East, has a reputation as a clean, healthy food. It deserves it. All the main ingredients are super foods in their own right. It's got chickpeas, sesame paste (tahini), garlic, and olive oil in most traditional versions",
          size: 'Big',
          weight: '720',
          time: 23,
        },
      ],
    },
    {
      id: 5,
      name: 'Masala dosa',
      image:
        'https://images.prismic.io/freshiiwebsite/41124fed-3b54-42ad-940c-d857e41ebc3f_Warm+Bowl+Rotatorv2.png?auto=compress,format&rect=0,0,1000,1000&w=500&h=500',
      description: 'slight tangy taste due to the fermentation',
      detials: [
        {
          price: 4.22,
          descriptions:
            'A dosa, also called dosai, dosey, or dosha is a thin pancake in South Indian cuisine made from a fermented batter of ground black lentils and rice. Dosas are popular in South Asia as well as around the world. Dosas are served hot, often with chutney and sambar.',
          size: 'Small',
          weight: '340',
          time: 22,
        },
      ],
    },
    {
      id: 6,
      name: 'Seafood',
      image:
        'https://static.cookunity.com/growth/media/landings/rebrand-meals/global-cusines/4.png',
      description:
        'ndescribably different about food that is harvested from the sea',
      detials: [
        {
          price: 5.34,
          descriptions:
            'eafood, edible aquatic animals, excluding mammals, but including both freshwater and ocean creatures.',
          size: 'Big',
          weight: '745',
          time: 34,
        },
      ],
    },
    {
      id: 7,
      name: 'Chichken rice',
      image:
        'https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&w=600',
      description: 'it is very aromatic and usually eaten with steam chicken',
      detials: [
        {
          price: 4.1,
          descriptions:
            'The Hainanese chicken rice is a dish that consists of succulent poached white chicken cut into bite-size pieces and served on fragrant rice with some light soy sauce. The dish is topped with sprigs of coriander leaf and sesame oil, and accompanied by a garlic-chilli dip.',
          size: 'Big',
          weight: '750',
          time: 31,
        },
      ],
    },
    {
      id: 8,
      name: 'Poutine',
      image:
        'https://www.seasonsandsuppers.ca/wp-content/uploads/2014/01/new-poutine-1.jpg',
      description: 'is unique and difficult to put into words',
      detials: [
        {
          price: 3.89,
          descriptions:
            "Similar to—but not the same as—disco fries, poutine is a delightful dive bar / diner snack that's made up of french fries topped with cheese curds and gravy.",
          size: 'Big',
          weight: '750',
          time: 39,
        },
      ],
    },
    {
      id: 9,
      name: 'Stinky tofu',
      image:
        'https://cdn.shopify.com/s/files/1/0421/5380/3934/files/food-recipe-bg1_1920x.png?v=1614322116',
      description: 'little sweet, a little sour, with a salty, savory flavor',
      detials: [
        {
          price: 4.56,
          descriptions:
            "Traditionally, it's made from fermented milk, vegetables, and meat, but might also include ingredients such as dried shrimp, amaranth greens, mustard greens, bamboo shoots, and Chinese herbs. The brine is left to ferment for several months, creating a highly potent mix.",
          size: 'Big',
          weight: '645',
          time: 40,
        },
      ],
    },
  ],
};

const PORT = 3000;

app.listen(3000, '0.0.0.0', () => {
  console.log(`Server Started at ${3000}`);
});

app.get('/api/drinks', (req, res) => {
  res.json(drinks);
});
app.get('/api/recommended', (req, res) => {
  res.json(recommended);
});
app.get('/api/dishes', (req, res) => {
  res.json(dishes);
});
app.get('/api/popular', (req, res) => {
  res.json(popular);
});
app.get('/api/desert', (req, res) => {
  res.json(desertFood);
});
app.get('/api/discount', (req, res) => {
  res.json(discount);
});
app.get('/api/desertsec', (req, res) => {
  res.json(desertSeco);
});
app.get('/api/meatpopular', (req, res) => {
  res.json(meatPopular);
});
app.get('/api/popular/:id', (req, res) => {
  const pop = popular.find((c) => c.id === parseInt(req.params.id));
  if (!pop) res.status(404).send('the course is not available');

  res.send(pop);
});
app.get('/api/meat', (req, res) => {
  res.json(meat);
});
const popular = {
  type_id: 11,
  offset: 0,
  products: [
    {
      id: 1,
      name: 'Beef Wellington',
      image:
        'https://images.pexels.com/photos/1833349/pexels-photo-1833349.jpeg?auto=compress&cs=tinysrgb&w=600',
      description: 'fried flatbreads and tangy chickpea curry',

      price: 5.44,
      descriptions:
        'It is a combination of chana masala (spicy white chickpeas) and bhatura/puri, a deep-fried bread made from maida. Although it is known as a typical Punjabi dish, It is originally a culinary dish of Delhi and Uttar Pradesh. Chole bhature is often eaten as a breakfast dish, sometimes accompanied with lass',
      size: 'Normal',
      weight: '450',
      time: 23,
    },
    {
      id: 2,
      name: 'BreakFast',
      image:
        'https://images.pexels.com/photos/5961879/pexels-photo-5961879.jpeg?auto=compress&cs=tinysrgb&w=600',
      description: 'masala has a nice balance',

      price: 10.25,
      descriptions:
        'It is named Pindi Chana after the town where it originated—Rawalpindi (Pakistan)—in the days before the India-Pakistan partition. Easy to cook, it makes for a wholesome meal when served with bread such as Kulcha or Naan and a green salad. Pindi Chana can be made with dried chickpeas too',
      size: 'Big',
      weight: '890',
      time: 21,
    },
    {
      id: 3,
      name: 'Chicken Marengo',
      image:
        'https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?auto=compress&cs=tinysrgb&w=600',
      description: 'brittle crust and soft potatoes',

      price: 13.65,
      descriptions:
        'A vegetable samosa is a savory pastry enjoyed at Indian restaurants. It can be an appetizer, snack, or entrée. The filling is made with potato, peas, chilies, ginger, and even more ingredients to amp up the flavor.',
      size: 'Big',
      weight: '970',
      time: 19,
    },
    {
      id: 4,
      name: 'Hummas',
      image:
        'https://images.pexels.com/photos/958546/pexels-photo-958546.jpeg?auto=compress&cs=tinysrgb&w=600',
      description: ' sweet, sour, bitter, salty and umami or savory',

      price: 8.89,
      descriptions:
        "Hummus, that creamy dip that hails from the Middle East, has a reputation as a clean, healthy food. It deserves it. All the main ingredients are super foods in their own right. It's got chickpeas, sesame paste (tahini), garlic, and olive oil in most traditional versions",
      size: 'Big',
      weight: '720',
      time: 23,
    },
    {
      id: 5,
      name: 'Eggs Benedict',
      image:
        'https://images.pexels.com/photos/1954526/pexels-photo-1954526.jpeg?auto=compress&cs=tinysrgb&w=600',
      description: 'slight tangy taste due to the fermentation',

      price: 7.88,
      descriptions:
        'A dosa, also called dosai, dosey, or dosha is a thin pancake in South Indian cuisine made from a fermented batter of ground black lentils and rice. Dosas are popular in South Asia as well as around the world. Dosas are served hot, often with chutney and sambar.',
      size: 'Small',
      weight: '340',
      time: 22,
    },
    {
      id: 6,
      name: 'Salisbury Steak',
      image:
        'https://images.pexels.com/photos/995735/pexels-photo-995735.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'ndescribably different about food that is harvested from the sea',

      price: 6.34,
      descriptions:
        'eafood, edible aquatic animals, excluding mammals, but including both freshwater and ocean creatures.',
      size: 'Big',
      weight: '745',
      time: 34,
    },
    {
      id: 7,
      name: 'Lobster Newburg',
      image:
        'https://images.pexels.com/photos/2260778/pexels-photo-2260778.jpeg?auto=compress&cs=tinysrgb&w=600',
      description: 'it is very aromatic and usually eaten with steam chicken',

      price: 9.45,
      descriptions:
        'The Hainanese chicken rice is a dish that consists of succulent poached white chicken cut into bite-size pieces and served on fragrant rice with some light soy sauce. The dish is topped with sprigs of coriander leaf and sesame oil, and accompanied by a garlic-chilli dip.',
      size: 'Big',
      weight: '750',
      time: 31,
    },
    {
      id: 8,
      name: 'Soup',
      image:
        'https://images.pexels.com/photos/141938/pexels-photo-141938.jpeg?auto=compress&cs=tinysrgb&w=600',
      description: 'is unique and difficult to put into words',

      price: 1.89,
      descriptions:
        "Similar to—but not the same as—disco fries, poutine is a delightful dive bar / diner snack that's made up of french fries topped with cheese curds and gravy.",
      size: 'Big',
      weight: '750',
      time: 39,
    },
    {
      id: 9,
      name: 'Waldorf Salad',
      image:
        'https://images.pexels.com/photos/2291347/pexels-photo-2291347.jpeg?auto=compress&cs=tinysrgb&w=600',
      description: 'little sweet, a little sour, with a salty, savory flavor',

      price: 4.56,
      descriptions:
        "Traditionally, it's made from fermented milk, vegetables, and meat, but might also include ingredients such as dried shrimp, amaranth greens, mustard greens, bamboo shoots, and Chinese herbs. The brine is left to ferment for several months, creating a highly potent mix.",
      size: 'Big',
      weight: '645',
      time: 40,
    },
  ],
};
const desertFood = {
  type_id: 6,
  offset: 0,
  products: [
    {
      id: 1,
      name: 'Pastries',
      image:
        'https://images.pexels.com/photos/15455916/pexels-photo-15455916.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'The term dessert can apply to many confections, such as biscuits, cakes, cookies',
      price: 3.23,
      descriptions:
        'pastry, stiff dough made from flour, salt, a relatively high proportion of fat, and a small proportion of liquid. It may also contain sugar or flavourings. Most pastry is leavened only by the action of steam, but Danish pastry is raised with yeast.',
      size: 'Normal',
      weight: '230',
      time: 12,
    },
    {
      id: 2,
      name: 'Deep-fried',
      image:
        'https://images.pexels.com/photos/14384810/pexels-photo-14384810.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'In its simplest form, deep-fried desserts are a category of cooked dessert',
      price: 2.55,
      descriptions:
        'Theres nothing quite like biting into a crispy, golden-brown crust and hitting fluffy, melted marshmallows, gooey chocolate, and all kinds of other goodness. ',
      size: 'Normal',
      weight: '240',
      time: 13,
    },
    {
      id: 3,
      name: 'Cakes',
      image:
        'https://images.pexels.com/photos/4887830/pexels-photo-4887830.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'What is a sweet cakeA sweet cake is one made entirely of sweets',
      price: 5.55,
      descriptions:
        'Cakes are sweet tender breads made with sugar and delicate flour. Cakes can vary from light, airy sponge cakes to dense cakes with less flour. Common flavorings include dried, candied or fresh fruit, nuts, cocoa or extracts.',
      size: 'Big',
      weight: '560',
      time: 18,
    },
    {
      id: 4,
      name: 'Sweet crêpes',
      image:
        'https://images.pexels.com/photos/14705094/pexels-photo-14705094.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'crepe, also spelled crêpe, French pancake made of a thin batter containing flour',
      price: 3.7,
      descriptions:
        'crepe, also spelled crêpe, French pancake made of a thin batter containing flour, eggs, melted butter, salt, milk, water, and, if the crepes are to be served with a sweet sauce or garnish, sugar. Crepes can be filled with a variety of sweet or savoury mixtures',
      size: 'Normal',
      weight: '345',
      time: 14,
    },
    {
      id: 5,
      name: 'Biscuits',
      image:
        'https://images.pexels.com/photos/9332172/pexels-photo-9332172.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'The term dessert can apply to many confections, such as biscuits, cakes, cookies, custards, gelatins, ice creams, ',
      price: 2.4,
      descriptions:
        'A cookie (American English), or a biscuit (British English), is a baked or cooked snack or dessert that is typically small, flat and sweet. It usually contains flour, sugar, egg, and some type of oil, fat, or butter. It may include other ingredients such as raisins,',
      size: 'Normal',
      weight: '345',
      time: 10,
    },
    {
      id: 6,
      name: 'Cupcakes',
      image:
        'https://images.pexels.com/photos/6845999/pexels-photo-6845999.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'A dessert is something sweet, such as fruit, pastry, or ice cream, that you eat at the end of a meal.',
      price: 3.5,
      descriptions:
        'Cupcakes are small, tasty snack cakes that are favored for their portability and portion-control. They are batter cakes baked in a cup-shaped foil or temperature resistant paper. A cupcake can be prepared from a variety of formulations and can be decorated with cream and icings',
      size: 'Normal',
      weight: '450',
      time: 12,
    },
  ],
};

const discount = {
  type_id: 4,
  offset: 0,
  products: [
    {
      id: 1,
      name: 'Pastries',
      image:
        'https://images.pexels.com/photos/6646358/pexels-photo-6646358.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'The term dessert can apply to many confections, such as biscuits, cakes, cookies',
      price: 15.23,
      descriptions:
        'Serving Breakfast, Lunch, Dinner, and Dessert 7 Days a Week. Order online or come in today. Fresh, delicious food to your delight. Eat in or take out. Order online',
      size: 'Big',
      weight: '2300',
      time: 21,
    },
    {
      id: 2,
      name: 'BreakFast',
      image:
        'https://images.pexels.com/photos/4873695/pexels-photo-4873695.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'In its simplest form, deep-fried desserts are a category of cooked dessert',
      price: 12.25,
      descriptions:
        'Theres nothing quite like biting into a crispy, golden-brown crust and hitting fluffy, melted marshmallows, gooey chocolate, and all kinds of other goodness. ',
      size: 'Big',
      weight: '3000',
      time: 24,
    },
    {
      id: 3,
      name: 'BreakFast',
      image:
        'https://images.pexels.com/photos/4873687/pexels-photo-4873687.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'What is a sweet cakeA sweet cake is one made entirely of sweets',
      price: 13.77,
      descriptions:
        'Cakes are sweet tender breads made with sugar and delicate flour. Cakes can vary from light, airy sponge cakes to dense cakes with less flour. Common flavorings include dried, candied or fresh fruit, nuts, cocoa or extracts.',
      size: 'Big',
      weight: '1400',
      time: 23,
    },
    {
      id: 4,
      name: 'Sweet crêpes',
      image:
        'https://images.pexels.com/photos/12737798/pexels-photo-12737798.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'crepe, also spelled crêpe, French pancake made of a thin batter containing flour',
      price: 16.7,
      descriptions:
        'crepe, also spelled crêpe, French pancake made of a thin batter containing flour, eggs, melted butter, salt, milk, water, and, if the crepes are to be served with a sweet sauce or garnish, sugar. Crepes can be filled with a variety of sweet or savoury mixtures',
      size: 'Normal',
      weight: '345',
      time: 20,
    },
    {
      id: 5,
      name: 'Chicken',
      image:
        'https://images.pexels.com/photos/12208780/pexels-photo-12208780.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'The term dessert can apply to many confections, such as biscuits, cakes, cookies, custards, gelatins, ice creams, ',
      price: 15.45,
      descriptions:
        'A cookie (American English), or a biscuit (British English), is a baked or cooked snack or dessert that is typically small, flat and sweet. It usually contains flour, sugar, egg, and some type of oil, fat, or butter. It may include other ingredients such as raisins,',
      size: 'Normal',
      weight: '1800',
      time: 32,
    },
  ],
};

const desertSeco = {
  type_id: 5,
  offset: 0,
  products: [
    {
      id: 1,
      name: 'Cake',
      image:
        'https://images.pexels.com/photos/5702856/pexels-photo-5702856.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'The term dessert can apply to many confections, such as biscuits, cakes, cookies',
      price: 1.65,
      descriptions:
        'Serving Breakfast, Lunch, Dinner, and Dessert 7 Days a Week. Order online or come in today. Fresh, delicious food to your delight. Eat in or take out. Order online',
      size: 'Big',
      weight: '340',
      time: 12,
    },
    {
      id: 2,
      name: 'Ghevar',
      image:
        'https://images.pexels.com/photos/5848195/pexels-photo-5848195.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'In its simplest form, deep-fried desserts are a category of cooked dessert',
      price: 3.44,
      descriptions:
        'Theres nothing quite like biting into a crispy, golden-brown crust and hitting fluffy, melted marshmallows, gooey chocolate, and all kinds of other goodness. ',
      size: 'Big',
      weight: '350',
      time: 12,
    },
    {
      id: 3,
      name: 'Carrot and walnut cake',
      image:
        'https://images.pexels.com/photos/10895948/pexels-photo-10895948.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'What is a sweet cakeA sweet cake is one made entirely of sweets',
      price: 5.45,
      descriptions:
        'Cakes are sweet tender breads made with sugar and delicate flour. Cakes can vary from light, airy sponge cakes to dense cakes with less flour. Common flavorings include dried, candied or fresh fruit, nuts, cocoa or extracts.',
      size: 'Big',
      weight: '280',
      time: 10,
    },
    {
      id: 4,
      name: 'crêpes',
      image:
        'https://images.pexels.com/photos/14122740/pexels-photo-14122740.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'crepe, also spelled crêpe, French pancake made of a thin batter containing flour',
      price: 8.2,
      descriptions:
        'crepe, also spelled crêpe, French pancake made of a thin batter containing flour, eggs, melted butter, salt, milk, water, and, if the crepes are to be served with a sweet sauce or garnish, sugar. Crepes can be filled with a variety of sweet or savoury mixtures',
      size: 'Normal',
      weight: '540',
      time: 16,
    },
    {
      id: 5,
      name: 'Birth Cake',
      image:
        'https://images.pexels.com/photos/4494543/pexels-photo-4494543.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'The term dessert can apply to many confections, such as biscuits, cakes, cookies, custards, gelatins, ice creams, ',
      price: 12.76,
      descriptions:
        'A cookie (American English), or a biscuit (British English), is a baked or cooked snack or dessert that is typically small, flat and sweet. It usually contains flour, sugar, egg, and some type of oil, fat, or butter. It may include other ingredients such as raisins,',
      size: 'Normal',
      weight: '1000',
      time: 22,
    },
  ],
};

const meatPopular = {
  type_id: 5,
  offset: 0,
  products: [
    {
      id: 1,
      name: 'Turkey',
      image:
        'https://images.pexels.com/photos/2233729/pexels-photo-2233729.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'Key ingredients being primarily meat, vegetable and legumes, Turkish meals are generally',
      price: 5.23,
      descriptions:
        'Turkish cuisine has a wide variety of foods, including cereals, pastries, vegetables, and self-growing herbs mixed with meat',
      size: 'Normal',
      weight: '456',
      time: 15,
    },
    {
      id: 2,
      name: 'Chicken',
      image:
        'https://images.pexels.com/photos/5876741/pexels-photo-5876741.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'A chicken is a bird. One of the features that differentiate it from most other birds is that it has a comb and two wattles.',
      price: 8.23,
      descriptions:
        'Chicken generally includes low fat in the meat itself (castrated roosters excluded). The fat is highly concentrated on the skin. A 100g serving of baked chicken breast contains 4 grams of fat and 31 grams of protein, compared to 10 grams of fat and 27 grams of protein for the same portion of broiled, lean skirt steak',
      size: 'Normal',
      weight: '1000',
      time: 17,
    },
    {
      id: 3,
      name: 'Goat',
      image:
        'https://images.pexels.com/photos/7474372/pexels-photo-7474372.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'goat, any ruminant and hollow-horned mammal belonging to the genus Capra.',
      price: 6.76,
      descriptions:
        'Goat meat is the meat of the domestic goat (Capra aegagrus hircus). It is often called chevon or mutton when the meat comes from adults, and cabrito, capretto, or kid when from young animals. Worldwide, goat meat is less widely consumed than pork, beef, and poultry.',
      size: 'Big',
      weight: '480',
      time: 16,
    },
    {
      id: 4,
      name: 'Gold Stick',
      image:
        'https://images.pexels.com/photos/3997609/pexels-photo-3997609.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'A ceremonial bodyguard to the British Royal Household, holding the rank of colonel.',
      price: 13.8,
      descriptions:
        'Edible gold leaf is a type of food-safe gold thats used as a decorative ingredient. Following the high-profile French haute cuisine, edible gold turns ...',
      size: 'Normal',
      weight: '650',
      time: 20,
    },
    {
      id: 5,
      name: 'Stick',
      image:
        'https://images.pexels.com/photos/2491273/pexels-photo-2491273.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'a thin piece of wood: The campers collected sticks to start a fire. A stick is also a long, thin handle with a specially shaped end, used esp. to play hockey and lacrosse',
      price: 16.87,
      descriptions:
        'Food Stick are a complete, scientifically formulated nutrient mix, developed for top-feeding carnivorous fish whose main diet of live food tends to cause nutritional deficiencies. Using Food Sticks instead of live foods reduces the chance of infection from parasites or bacteria which tend to hitchhike in live foods.',
      size: 'Normal',
      weight: '1000',
      time: 25,
    },
  ],
};

const meat = {
  type_id: 4,
  offset: 0,
  products: [
    {
      id: 1,
      name: 'Lamb',
      image:
        'https://images.pexels.com/photos/2871755/pexels-photo-2871755.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'lamb, live sheep before the age of one year and the flesh of such an animal',
      price: 14.54,
      descriptions:
        'A young sheep, generally between 5 to 12 months of age. Lamb meat is lean with a distinctive flavor. Although it is eaten much less often than beef in the U.S., lamb is the meat of choice in many parts of the world, both for everyday meals and holiday feasts.',
      size: 'Normal',
      weight: '1200',
      time: 25,
    },
    {
      id: 2,
      name: 'Goat',
      image:
        'https://images.pexels.com/photos/15476370/pexels-photo-15476370.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'goat, any ruminant and hollow-horned mammal belonging to the genus Capra',
      price: 12.65,
      descriptions:
        'goat, any ruminant and hollow-horned mammal belonging to the genus Capra. Related to the sheep, the goat is lighter of build, has horns that arch backward, a short tail, and straighter hair. Male goats,',
      size: 'Normal',
      weight: '1000',
      time: 32,
    },
    {
      id: 3,
      name: 'Bison',
      image:
        'https://images.pexels.com/photos/15476371/pexels-photo-15476371.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'Bison are the largest mammal in North America.Male bison (called bulls) weigh up to 2,000 pounds and stand 6 feet tall',
      price: 20.2,
      descriptions:
        'Bison are the largest mammal in North America.Male bison (called bulls) weigh up to 2,000 pounds and stand 6 feet tall, while females (called cows) weigh up to 1,000 pounds and reach a height of 4-5 feet. Bison calves weigh 30-70 pounds at birth. Bison at Rocky Mountain Arsenal National Wildlife Refuge in Colorado',
      size: 'Big',
      weight: '1600',
      time: 37,
    },
    {
      id: 4,
      name: 'Veal',
      image:
        'https://images.pexels.com/photos/3997609/pexels-photo-3997609.jpeg?auto=compress&cs=tinysrgb&w=600',
      description:
        'Veal is the meat from a calf or young beef animal. A veal calf is raised until about 16 to 18 weeks of age, weighing up to 450 pounds',
      price: 15.5,
      descriptions:
        'Veal is the meat from a calf or young beef animal. A veal calf is raised until about 16 to 18 weeks of age, weighing up to 450 pounds. Male dairy calves are used in the veal industry. Dairy cows must give birth to continue producing milk, but male dairy calves are of little or no value to the dairy farmer',
      size: 'Normal',
      weight: '900',
      time: 25,
    },
  ],
};
