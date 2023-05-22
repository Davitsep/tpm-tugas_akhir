import 'package:flutter/material.dart';
import 'package:shared_preference/shared_preferences_service.dart';
import 'login_page.dart';
import 'menu.dart';
import 'kesan.dart';

SharedPreferencesService sharedPreferencesService = SharedPreferencesService();

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  @override
  int _selectedIndex = 0;
  String tittle = '';
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      MenuPage(),
      KesanPage(),
    ];

    void _onItemTapped(int index) {
      if (index == 2) {
        _logOut(context);
      } else {
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black //here you can give the text color
            ),
        primarySwatch: primaryBlack,
      ),
      home: Scaffold(
        body: Center(
          child: pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Kesan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Logout',
            ),
          ],
          currentIndex: _selectedIndex,
          //New
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

Future<void> _logOut(BuildContext context) async {
  await sharedPreferencesService.setLoggedIn(false);
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
}

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;
