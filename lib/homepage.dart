import 'package:flutter/material.dart';
import 'package:projectexpo/companylist.dart';
import 'package:projectexpo/interviews.dart'; // Import the interviews file

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
      body: _selectedIndex == 0
          ? _buildHomePage()
          : _selectedIndex == 1
              ? _buildCompaniesPage()
              : _selectedIndex == 2 // Interviews
                  ? _buildInterviewsPage()
                  : _buildSettingsPage(), // Settings
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
            backgroundColor: Color.fromARGB(255, 255, 223, 163), // Set the background color
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'companies',
            backgroundColor:  Color.fromARGB(255, 255, 223, 163), // Set the background color
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.start_rounded),
            label: 'interviews',
            backgroundColor: Color.fromARGB(255, 255, 223, 163), // Set the background color
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0), // Set the selected item color
        unselectedItemColor: const Color.fromARGB(255, 4, 4, 4), // Set the unselected item color
      ),
    );
  }

  Widget _buildHomePage() {
    final List<Map<String, dynamic>> trendingCompanies = [
      {
        'name': 'Google',
        'logo': 'images/google1.png',
        'description': 'Google is a leader in technology and AI.',
      },
      {
        'name': 'Amazon',
        'logo': 'images/amazon.png',
        'description': 'Amazon is a major player in e-commerce and cloud computing.',
      },
      {
        'name': 'Microsoft',
        'logo': 'images/micro.png',
        'description': 'Microsoft provides a range of software and cloud services.',
      },
      {
        'name': 'Apple',
        'logo': 'images/apple.png',
        'description': 'Apple is a leading technology company known for its smartphones and computers.',
      },
      {
        'name': 'Meta',
        'logo': 'images/facebook.png',
        'description': 'Meta focuses on social media and virtual reality.',
      },
      {
        'name': 'Qualcomm',
        'logo': 'images/qual.png',
        'description': 'Qualcomm specializes in semiconductor and telecommunications.',
      },
      {
        'name': 'TCS',
        'logo': 'images/tcs1.png',
        'description': 'TCS is a leading global IT services company.',
      },
      {
        'name': 'Wipro',
        'logo': 'images/wipro.png',
        'description': 'Wipro is a leading global IT services company.',
      },
      {
        'name': 'Infosys',
        'logo': 'images/infosys.png',
        'description': 'Infosys is a leading global IT services company.',
      },
    ];

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Trending Freshers Hiring Companies 2025",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: trendingCompanies.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.asset(
                    trendingCompanies[index]['logo']!,
                    width: 40,
                    height: 40,
                  ),
                  title: Text(trendingCompanies[index]['name']!),
                  subtitle: Text(trendingCompanies[index]['description']!),
                  onTap: () {
                    // Navigate to company list page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCompaniesPage() {
    return const Companylist();
  }

  Widget _buildInterviewsPage() {
    return const InterviewsPage(); // Use the InterviewsPage widget
  }

  Widget _buildSettingsPage() {
    return const Center(
      child: Text('Settings Page Content'),
    );
  }
}