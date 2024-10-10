import 'package:flutter/material.dart';
import 'package:stanch_flutter_task/views/meetup_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            color: Colors.blue,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.black,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Prolet",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.handshake),
              label: "Meetup",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_copy),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
            ),
          ],
        ),
        body: const MeetUpScreen());
  }
}
