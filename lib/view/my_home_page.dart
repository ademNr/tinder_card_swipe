import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:tinder_swipe_card/controllers/button_color_controller.dart';
import 'package:tinder_swipe_card/models/food_model.dart';
import 'package:tinder_swipe_card/widgets/swipe_card.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FoodModel foodModel1 = FoodModel(image: "lib/assets/barbequeBurgur.jpg", sandwichName: "Barbeque Burger", garniture: "Barbeque Beef, onion, mustard, mayo, salad, tomatoes");
    FoodModel foodModel5= FoodModel(image: "lib/assets/food.jpg", sandwichName: "Bacon Burger", garniture: "Bacon, onion, mustard, mayo, salad, tomatoes, pickles");  
      FoodModel foodModel2 = FoodModel(image: "lib/assets/buffalo.jpg", sandwichName: "Buffalo Burger", garniture: "Buffalo chicken, onion, mustard, mayo, salad, tomatoes"); 
        FoodModel foodModel3 = FoodModel(image: "lib/assets/chikenWings.jpg", sandwichName: "Chiken Wings", garniture: "potatoes, mayo sauce"); 
          FoodModel foodModel4 = FoodModel(image: "lib/assets/frenchFries.jpg", sandwichName: "French fries", garniture: "mayo sauce, ketchup"); 
  List<FoodModel> foodList = []; 
    SwipeableCardSectionController _cardController = SwipeableCardSectionController();
     int i =  0;
     ButtonColorController buttonColorController = Get.put(ButtonColorController()); 
    @override
  void initState() {
    // TODO: implement initState
    foodList.add(foodModel1);
    foodList.add(foodModel2);
     foodList.add(foodModel3);
      foodList.add(foodModel4);
      foodList.add(foodModel5);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color.fromARGB(255, 213, 206, 206).withOpacity(0.8),
      appBar: AppBar(
     backgroundColor: Color(0xFFF68720),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.notifications, size: 25,color: Colors.white,))
        ],
        title: Row(children: [
          Icon(Icons.restaurant_menu, color: Colors.white,), 
          SizedBox(width: 5,),
          Text(
    'Foodify',
    style: TextStyle(
        color: Colors.white,
        fontSize: 22  ,
        fontFamily: "Inter",
        letterSpacing: 0.5,
        fontWeight: FontWeight.w900,
        height: 0,
    ),
)
        ]),
        elevation:0.5 ,
       
        ),
  
 body: Column(
   mainAxisAlignment: MainAxisAlignment.start,
   children:[ 
  SizedBox(height: 10,),
     SwipeableCardsSection(
        cardHeightTopMul: 0.9,
        cardHeightMiddleMul: 0.7,
        cardWidthBottomMul: 0.95,
        cardWidthTopMul: 0.95,
        cardHeightBottomMul:0.7 ,
       
        cardWidthMiddleMul:0.95  ,
       
       
                cardController: _cardController,
                context: context,
                //add the first 3 cards (widgets)
                items: [
                  SwipeCard(foodModel: foodModel1,),
                  SwipeCard(foodModel: foodModel2,),
                  SwipeCard(foodModel: foodModel3,),
                  
                    
                 
                ],
                //Get card swipe event callbacks
                onCardSwiped: (dir, index, widget) {
                   if(dir == Direction.right){

  buttonColorController.swipeRight.value = true; 
  Timer(Duration(milliseconds: 150), () {
         buttonColorController.swipeRight.value = false; 
      });
 
                  }else if(dir == Direction.left){
                     buttonColorController.swipeLeft.value = true; 
  Timer(Duration(milliseconds: 150), () {
         buttonColorController.swipeLeft.value = false; 
      });
                  }
                  //Add the next card using _cardController
                 
                  if(i==foodList.length-1){
                    setState(() {
                      
                      i = 0; 
                    });
                  }else{
                   setState(() {
                     i ++ ; 
                   }); 
                  }
                    _cardController.addItem(SwipeCard(foodModel: foodList[i], ));
               
               
                  
                  //Take action on the swiped widget based on the direction of swipe
                 
                
                  //Return false to not animate cards
                },
                //
                enableSwipeUp: true,
                enableSwipeDown: false,
              ),
            
    SizedBox(height: 10,)
   ]
 ),
    );
  }
}