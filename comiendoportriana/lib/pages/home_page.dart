import 'package:comiendoportriana/pages/bares_page.dart';
import 'package:comiendoportriana/pages/login_page.dart';
import 'package:comiendoportriana/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comiendoportriana/blocs/authentication/authentication.dart';
import 'package:comiendoportriana/config/locator.dart';
import 'package:comiendoportriana/services/services.dart';
import '../models/models.dart';

List<Widget> _widgetOptions = <Widget>[
  BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
    if (state is AuthenticationNotAuthenticated) {
      return LoginPage();
    } else if (state is AuthenticationAuthenticated) {
      return BaresPage();
    }
    return Text("Loading");
  }),
  ProfilePage(),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key, required});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/logo-title.png', 
            color: Colors.red.shade800,
        ),
        title: Image.asset('assets/images/logo-title.png',
            height: 170, 
            color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => {authBloc.add(UserLoggedOut())},
              icon: Icon(Icons.logout))
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Restaurantes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.amber[700],
        onTap: _onItemTapped,
      ),
    );
  }
}
