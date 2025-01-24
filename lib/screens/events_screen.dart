import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = [
      {
        'title': 'Community Tree Planting',
        'date': '2024-03-01',
        'location': 'Kandy Lake',
        'participants': 25,
      },
      {
        'title': 'Beach Cleanup Drive',
        'date': '2024-03-15',
        'location': 'Mount Lavinia',
        'participants': 40,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.green.shade100,
                  child: const Center(
                    child: Icon(Icons.event, size: 48),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event['title'] as String? ?? 'No Title',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 16),
                          const SizedBox(width: 8),
                          Text(event['date'] as String? ?? 'No Date'),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 16),
                          const SizedBox(width: 8),
                          Text(event['location'] as String? ?? 'No Location'),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.people, size: 16),
                          const SizedBox(width: 8),
                          Text('${event['participants']} participants'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Implement event registration
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Successfully registered for event'),
                              ),
                            );
                          },
                          child: const Text('Join Event'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
