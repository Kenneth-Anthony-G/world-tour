import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  List<Widget> screens = [Home(),Home(),Home(),Home(),Home(),];

  void onTap(int i){
    setState(() {
      currentIndex = i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex,children: screens,),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline_outlined),label: 'Publish'),
            BottomNavigationBarItem(icon: Icon(Icons.route_rounded),label: 'Your trips'),
            BottomNavigationBarItem(icon: Icon(Icons.chat_outlined),label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: 'Profile'),
          ]),
    );
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is the home screen')
      )
    );
  }
}
