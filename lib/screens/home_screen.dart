import 'package:flutter/material.dart';
import 'report_screen.dart';
import 'tree_planting_screen.dart';
import 'education_screen.dart';
import 'events_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GreenLanka'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Impact',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem(
                          context,
                          '5',
                          'Trees Planted',
                          Icons.nature,
                        ),
                        _buildStatItem(
                          context,
                          '3',
                          'Reports Made',
                          Icons.report_problem,
                        ),
                        _buildStatItem(
                          context,
                          '2',
                          'Events Joined',
                          Icons.event,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Quick Actions Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildActionCard(
                  context,
                  'Report an Issue',
                  Icons.report_problem,
                  Colors.red.shade100,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ReportScreen()),
                  ),
                ),
                _buildActionCard(
                  context,
                  'Plant a Tree',
                  Icons.nature,
                  Colors.green.shade100,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TreePlantingScreen()),
                  ),
                ),
                _buildActionCard(
                  context,
                  'Learn',
                  Icons.school,
                  Colors.blue.shade100,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EducationScreen()),
                  ),
                ),
                _buildActionCard(
                  context,
                  'Events',
                  Icons.event,
                  Colors.orange.shade100,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EventsScreen()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String value,
    String label,
    IconData icon,
  ) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}