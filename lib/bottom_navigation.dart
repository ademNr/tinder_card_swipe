import 'package:flutter/material.dart';
import 'package:tinder_swipe_card/view/my_home_page.dart';



class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static  List<Widget> _widgetOptions = <Widget>[
   MyHomePage(), 
  Text(""),
     Text(""),
     Text("")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
    ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        elevation: 1,
        
        items: const <BottomNavigationBarItem>[
          
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant, size : 30),
            label: '',
       
            
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size : 30),
            label: '',
            
           
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, size: 30,),
            label: '',
       
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 30,),
            label: '',
           
          ),
        
        
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFF68720),
       unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.white
      ),
    );
  }
}
