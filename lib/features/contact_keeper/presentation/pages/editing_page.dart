import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

import '../widgets/application_app_bar.dart';

class EditingPage extends StatefulWidget {
  const EditingPage({super.key});
  @override
  _EditingPageState createState() => _EditingPageState();
}

class _EditingPageState extends State<EditingPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _addressController,
              maxLines: 2,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _updateContact,
              child: const Text('Update Contact'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateContact() {
    // Implement saving contact logic here
    // For simplicity, we'll just print the values for now
    print('Name: ${_nameController.text}');
    print('Phone: ${_phoneController.text}');
    print('Email: ${_emailController.text}');
    print('Address: ${_addressController.text}');
  }
}
