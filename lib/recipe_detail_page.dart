import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecipeDetailPage extends StatefulWidget {
  final DocumentSnapshot recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _ingredientsController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.recipe['name']);
    _descController = TextEditingController(text: widget.recipe['description']);
    _ingredientsController = TextEditingController(text: widget.recipe['ingredients']);
    super.initState();
  }

  void _updateRecipe() async {
    await FirebaseFirestore.instance
        .collection('recipes')
        .doc(widget.recipe.id)
        .update({
      'name': _nameController.text.trim(),
      'description': _descController.text.trim(),
      'ingredients': _ingredientsController.text.trim(),
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Resep")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
              maxLines: 3,
            ),
            TextFormField(
              controller: _ingredientsController,
              decoration: const InputDecoration(labelText: 'Bahan-bahan'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _updateRecipe,
              icon: const Icon(Icons.save),
              label: const Text("Simpan Perubahan"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
            ),
          ],
        ),
      ),
    );
  }
}