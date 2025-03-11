import 'package:flutter/material.dart';

class Companylist extends StatefulWidget {
  const Companylist({super.key});

  @override
  _CompanylistState createState() => _CompanylistState();
}

class _CompanylistState extends State<Companylist> {
  final List<Map<String, dynamic>> companies = [
    {
      'name': 'Intel',
      'logo': 'images/intel.png',
      'founder': 'Gordon Moore',
      'ceo': 'Pat Gelsinger',
      'year_started': 1968,
      'cities': ['Santa Clara', 'Hillsboro'],
      'num_employees': 110600,
      'qualification': 'B.Tech in Computer Science',
      'freshers_hiring_per_year': 5000,
      'vacancies': 200,
      'reviews': '4.5/5',
      'contact': '1-800-538-3373',
      'maps': 'https://www.intel.com/content/www/us/en/maps.html',
      'feedback_form': 'https://www.intel.com/content/www/us/en/contact-us.html',
      'expected_salary': '₹8,00,000',
      'internships': ['Software Engineering Intern', 'Hardware Design Intern'],
      'job_listings': ['Software Engineer', 'Hardware Engineer'],
      'insights': 'Intel is a leader in semiconductor technology.',
      'skill_development': ['C++', 'Python', 'VLSI Design'],
      'networking': ['Industry events', 'Online forums'],
      'mentorships': ['Senior engineers', 'Team leads'],
      'scholarships': ['Intel Scholars Program'],
      'competitions': ['Intel AI Global Impact Festival'],
    },
    {
      'name': 'Microsoft',
      'logo': 'images/micro.png',
      'founder': 'Bill Gates',
      'ceo': 'Satya Nadella',
      'year_started': 1975,
      'cities': ['Redmond', 'San Francisco'],
      'num_employees': 181000,
      'qualification': 'B.Tech in Computer Science',
      'freshers_hiring_per_year': 6000,
      'vacancies': 300,
      'reviews': '4.6/5',
      'contact': '1-800-642-7676',
      'maps': 'https://www.microsoft.com/en-us/maps',
      'feedback_form': 'https://www.microsoft.com/en-us/contact',
      'expected_salary': '₹9,00,000',
      'internships': ['Software Development Intern', 'Program Management Intern'],
      'job_listings': ['Software Developer', 'Program Manager'],
      'insights': 'Microsoft is a leader in software and cloud computing.',
      'skill_development': ['C#', '.NET', 'Azure'],
      'networking': ['Microsoft events', 'LinkedIn groups'],
      'mentorships': ['Microsoft mentors'],
      'scholarships': ['Microsoft Scholarships'],
      'competitions': ['Imagine Cup'],
    },
    // Add more companies here...
  ];

  List<Map<String, dynamic>> _filteredCompanies = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredCompanies = companies;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredCompanies = companies
          .where((company) => company['name']
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search Companies',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCompanies.length,
              itemBuilder: (context, index) {
                final company = _filteredCompanies[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(
                      company['logo'],
                      width: 50,
                      height: 50,
                    ),
                    title: Text(
                      company['name'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CompanyDetailsPage(company: company),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CompanyDetailsPage extends StatelessWidget {
  final Map<String, dynamic> company;

  const CompanyDetailsPage({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  company['logo'],
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 16),
              Text('Founder: ${company['founder']}'),
              Text('CEO: ${company['ceo']}'),
              Text('Year Started: ${company['year_started']}'),
              Text('Cities: ${company['cities'].join(', ')}'),
              Text('Number of Employees: ${company['num_employees']}'),
              Text('Qualification: ${company['qualification']}'),
              Text('Freshers Hiring Per Year: ${company['freshers_hiring_per_year']}'),
              Text('Vacancies: ${company['vacancies']}'),
              Text('Reviews: ${company['reviews']}'),
              Text('Contact: ${company['contact']}'),
              Text('Maps: ${company['maps']}'),
              Text('Feedback Form: ${company['feedback_form']}'),
              Text('Expected Salary: ${company['expected_salary']}'),
              const SizedBox(height: 16),
              _buildHighlightedSection('Internships', company['internships']),
              _buildHighlightedSection('Job Listings', company['job_listings']),
              _buildHighlightedSection('Company Insights', [company['insights']]),
              _buildHighlightedSection('Skill Development', company['skill_development']),
              _buildHighlightedSection('Networking', company['networking']),
              _buildHighlightedSection('Mentorships', company['mentorships']),
              _buildHighlightedSection('Scholarships', company['scholarships']),
              _buildHighlightedSection('Competitions', company['competitions']),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHighlightedSection(String title, List<String>? items) {
    if (items == null || items.isEmpty) return const SizedBox.shrink();

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            for (var item in items)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text('- $item'),
              ),
          ],
        ),
      ),
    );
  }
}

// Example usage in your HomePage:
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies List'),
      ),
    );
  }
}
