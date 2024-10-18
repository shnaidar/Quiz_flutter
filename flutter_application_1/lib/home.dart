import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Add navigation to settings page if needed
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Add navigation to about page if needed
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
class NextPage extends StatelessWidget {
  const NextPage({super.key});

  void _handleColorSelection(BuildContext context, String color) {
    // Show a message with the selected color
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You selected: $color'),
        duration: const Duration(seconds: 2),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'What is your preferred color?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // Space between question and buttons
            ElevatedButton(
              onPressed: () => _handleColorSelection(context, 'Red'),
              child: const Text('Red'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Button color
                padding: const EdgeInsets.symmetric(horizontal: 30,
vertical: 15),
              ),
            ),
            const SizedBox(height: 20), // Space between buttons
            ElevatedButton(
              onPressed: () => _handleColorSelection(context, 'Blue'),
              child: const Text('Blue'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                padding: const EdgeInsets.symmetric(horizontal: 30,
vertical: 15),
              ),
            ),
            const SizedBox(height: 20), // Space between buttons
            ElevatedButton(
              onPressed: () => _handleColorSelection(context, 'Green'),
              child: const Text('Green'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color


                padding: const EdgeInsets.symmetric(horizontal: 30,
vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
