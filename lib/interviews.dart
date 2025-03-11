import 'package:flutter/material.dart';

class InterviewsPage extends StatelessWidget {
  const InterviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> interviewQuestions = [
      {
        'question': 'Tell me about yourself.',
        'category': 'Behavioral',
      },
      {
        'question': 'What are your strengths and weaknesses?',
        'category': 'Behavioral',
      },
      {
        'question': 'Why do you want to work for this company?',
        'category': 'Behavioral',
      },
      {
        'question': 'Describe a time you faced a challenge and how you overcame it.',
        'category': 'Behavioral',
      },
      {
        'question': 'Explain the concept of object-oriented programming.',
        'category': 'Technical (Programming)',
      },
      {
        'question': 'What is the difference between an array and a linked list?',
        'category': 'Technical (Data Structures)',
      },
      {
        'question': 'Describe how a relational database works.',
        'category': 'Technical (Databases)',
      },
      {
        'question': 'What is the purpose of a REST API?',
        'category': 'Technical (Web Development)',
      },
      {
        'question': 'Explain the concept of machine learning.',
        'category': 'Technical (AI/ML)',
      },
      {
        'question': 'How do you handle conflict within a team?',
        'category': 'Behavioral',
      },
      {
        'question': 'What are your salary expectations?',
        'category': 'Behavioral',
      },
      {
        'question': 'Where do you see yourself in five years?',
        'category': 'Behavioral',
      },
      {
        'question': 'What is the difference between TCP and UDP?',
        'category': 'Technical (Networking)'
      },
      {
        'question': 'Explain the concept of a virtual machine',
        'category': 'Technical (Operating Systems)'
      },
      {
        'question': 'What is a design pattern?',
        'category': 'Technical (Software Design)'
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Interview Questions'),
      ),
      body: ListView.builder(
        itemCount: interviewQuestions.length,
        itemBuilder: (context, index) {
          final question = interviewQuestions[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question['question'],
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Category: ${question['category']}',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}