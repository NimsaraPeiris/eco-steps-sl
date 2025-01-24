import 'package:flutter/material.dart';

class TreePlantingScreen extends StatefulWidget {
  const TreePlantingScreen({Key? key}) : super(key: key);

  @override
  State<TreePlantingScreen> createState() => _TreePlantingScreenState();
}

class _TreePlantingScreenState extends State<TreePlantingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _treeTypeController = TextEditingController();
  final List<Map<String, dynamic>> _plantedTrees = [
    {
      'type': 'Mango Tree',
      'date': '2024-02-20',
      'location': 'Kandy',
    },
    {
      'type': 'Teak Tree',
      'date': '2024-02-18',
      'location': 'Colombo',
    },
  ];

  @override
  void dispose() {
    _treeTypeController.dispose();
    super.dispose();
  }

  void _addTree() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement tree planting record
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tree added successfully')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant a Tree'),
      ),
      body: Column(
        children: [
          // Stats Card
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        _plantedTrees.length.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const Text('Trees Planted'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '2.5 kg',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const Text('CO₂ Absorbed'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Tree List
          Expanded(
            child: ListView.builder(
              itemCount: _plantedTrees.length,
              itemBuilder: (context, index) {
                final tree = _plantedTrees[index];
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.nature),
                  ),
                  title: Text(tree['type']),
                  subtitle: Text('${tree['location']} - ${tree['date']}'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _treeTypeController,
                      decoration: const InputDecoration(
                        labelText: 'Tree Type',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter tree type';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: () {
                        // TODO: Implement image picker
                      },
                      icon: const Icon(Icons.photo_camera),
                      label: const Text('Add Photo'),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _addTree,
                        child: const Text('Add Tree'),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}