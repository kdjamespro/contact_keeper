import 'package:contact_keeper/features/contact_keeper/domain/entities/contact_entity.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/bloc/contact/contact_bloc.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/bloc/contact/contact_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contact_keeper/core/util/input_validator.dart';

class EditingPage extends StatefulWidget {
  final ContactEntity contact;
  const EditingPage({super.key, required this.contact});
  @override
  _EditingPageState createState() => _EditingPageState();
}

class _EditingPageState extends State<EditingPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.contact.name;
    _phoneController.text = widget.contact.phone;
    _emailController.text = widget.contact.email;
    _addressController.text = widget.contact.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                validator: validateName,
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  icon: Icon(Icons.account_box),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                validator: validatePhone,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  icon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                validator: validateEmail,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  icon: Icon(Icons.house),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _updateContact(context, widget.contact),
                child: const Text('Update Contact'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateContact(BuildContext context, ContactEntity contact) {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<ContactBloc>(context).add(UpdateContact(ContactEntity(
          id: contact.id,
          name: _nameController.text,
          phone: _phoneController.text,
          email: _emailController.text,
          address: _addressController.text)));
      Navigator.pop(context, true);
    }
  }
}
