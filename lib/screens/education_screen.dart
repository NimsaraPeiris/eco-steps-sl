import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Learn'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Articles'),
              Tab(text: 'Videos'),
              Tab(text: 'Tips'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildArticlesList(),
            _buildVideosList(),
            _buildTipsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildArticlesList() {
    final articles = [
      {
        'title': 'Sri Lankan Leopard: A Threatened Species',
        'description': 'Learn about the endangered Sri Lankan leopard...',
        'image': 'https://example.com/leopard.jpg',
      },
      {
        'title': 'Deforestation in Sri Lanka',
        'description': 'Understanding the impact of deforestation...',
        'image': 'https://example.com/forest.jpg',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey.shade200,
                child: const Center(
                  child: Icon(Icons.photo, size: 48),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(article['description']!),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        // TODO: Navigate to full article
                      },
                      child: const Text('Read More'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVideosList() {
    return const Center(
      child: Text('Videos coming soon...'),
    );
  }

  Widget _buildTipsList() {
    final tips = [
      'Plant native trees in your garden',
      'Reduce plastic usage',
      'Start composting at home',
      'Save water by fixing leaks',
      'Use public transport when possible',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tips.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(tips[index]),
          ),
        );
      },
    );
  }
}