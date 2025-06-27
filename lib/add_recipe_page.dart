import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isSaving = false;

  Future<void> _saveRecipe() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    final user = FirebaseAuth.instance.currentUser;
    try {

    await FirebaseFirestore.instance.collection('recipes').add({
      'uid': user!.uid,
      'name': _nameController.text.trim(),
      'description': _descController.text.trim(),
      'ingredients': _ingredientsController.text.trim(),
      'createdAt': Timestamp.now(),
    });
    }
      catch (e) {
  print('Gagal simpan resep: $e');
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Error: $e')),
  );
}
    

    setState(() => _isSaving = false);

    Navigator.pop(context); // Kembali ke halaman list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Resep')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isSaving
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Nama Resep'),
                      validator: (value) =>
                          value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                    ),
                    TextFormField(
                      controller: _descController,
                      decoration: const InputDecoration(labelText: 'Deskripsi'),
                      maxLines: 4,
                      validator: (value) =>
                          value!.isEmpty ? 'Deskripsi tidak boleh kosong' : null,
                    ),
                    TextFormField(
                      controller: _ingredientsController,
                      decoration:
                          const InputDecoration(labelText: 'Bahan-bahan'),
                      maxLines: 4,
                      validator: (value) =>
                          value!.isEmpty ? 'Bahan tidak boleh kosong' : null,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _saveRecipe,
                      child: const Text('Simpan Resep', style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
