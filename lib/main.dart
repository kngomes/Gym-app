import 'package:flutter/material.dart';

// Páginas
import 'pages/start_page.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/home_page.dart';
import 'pages/workouts_page.dart';
import 'pages/nutrition_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // COMEÇA NA START PAGE
      home: const StartPage(),

      // ROTAS NOMEADAS
      routes: {
        "/start": (context) => const StartPage(),
        "/login": (context) => const LoginPage(),
        "/signup": (context) => const SignUpPage(),
        "/home": (context) => const MainNavigation(),
      },
    );
  }
}

// ==========================================
// MAIN NAVIGATION (HOME, TREINOS, NUTRIÇÃO, PERFIL)
// ==========================================
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomePage(),
    WorkoutsPage(),
    NutritionPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            IconData icon;
            switch (index) {
              case 0:
                icon = Icons.home;
                break;
              case 1:
                icon = Icons.fitness_center;
                break;
              case 2:
                icon = Icons.restaurant_menu;
                break;
              default:
                icon = Icons.person;
            }

            bool isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? Colors.blue.withValues(alpha: 0.4)
                          : Colors.black12,
                      blurRadius: isSelected ? 10 : 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Colors.blue : Colors.grey,
                  size: 28,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
