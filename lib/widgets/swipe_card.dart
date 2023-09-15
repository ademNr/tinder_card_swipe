import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:tinder_swipe_card/controllers/button_color_controller.dart';
import 'package:tinder_swipe_card/models/food_model.dart';

class SwipeCard extends StatefulWidget {
  FoodModel? foodModel ; 


  SwipeCard({Key? key,required this.foodModel,  })
      : super(key: key);

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  ButtonColorController buttonColorController = Get.put(ButtonColorController());
  @override
  Widget build(BuildContext context) {
    // Get the screen's width and height
 double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
     children: [
       Container(
        
        height: screenHeight,
        width: screenWidth,
       
         child: ClipRRect(
          
          borderRadius: BorderRadius.circular(10.0),
          child: Opacity(
            opacity: 0.9999 ,
            child: Image.asset("${widget.foodModel?.image.toString()}", fit: BoxFit.cover,filterQuality: FilterQuality.high,colorBlendMode: BlendMode.darken,)))), 
            Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.98), // Transparent black
                        Colors.transparent, // Fully transparent
                      ],
                    ),
                  ),),
            
           Padding(
            padding: EdgeInsets.all(30),
             child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Text("${widget.foodModel?.sandwichName}", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w700),), 
                Text("${widget.foodModel?.garniture}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),), 
                
                ],
              ),
              SizedBox(height : 20),
               Positioned(
                 bottom: 20.0, // Adjust the position as needed
                     left: 0,
                     right: 0,
                child: Obx(
                  ()=> Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                   //#20C997
                    children: [
                          //-----------------------------------------cancel------------------------
                      FloatingActionButton(
                    onPressed: () {
                      // Handle button 1 tap
                    },
                    child: Image.asset("lib/assets/cancel.png", scale: 2,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0), // Circular border
                      side: BorderSide(color: Colors.red, width: 1.0), // Red border
                    ),
                    backgroundColor:   buttonColorController.swipeLeft.value ? Colors.red.withOpacity(0.2 ) : Colors.transparent , // Transparent interior // Transparent interior
                  ),
                           
                  //-----------------------------------------love------------------------
                     
                      FloatingActionButton(
                                         onPressed: () {
                                           // Handle button 1 tap
                                         },
                                         child: Image.asset("lib/assets/love.png", scale: 2,),
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(50.0), // Circular border
                                           side: BorderSide(color: Color(0xFFF20C997), width: 1.0), // Red border
                                         ),
                                         backgroundColor:   buttonColorController.swipeRight.value ? Color(0xFFF20C997).withOpacity(0.2 ) : Colors.transparent , // Transparent interior
                                       ),
                       
                    ],
                  ),
                ),
              ), 
             ],),
           )
            //
           
     ],
    );
  }
}