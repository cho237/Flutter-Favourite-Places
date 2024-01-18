import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/user_places.dart';

class AddPlaces extends ConsumerStatefulWidget {
  const AddPlaces({super.key});

  @override
  ConsumerState<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends ConsumerState<AddPlaces> {
  final _titleController = TextEditingController();

  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty) {
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: _savePlace,
              label: const Text("Add Place"),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
