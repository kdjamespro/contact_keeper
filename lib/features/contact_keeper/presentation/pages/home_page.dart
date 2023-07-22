import 'package:contact_keeper/features/contact_keeper/domain/entities/contact_entity.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/bloc/contact/contact_bloc.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/bloc/contact/contact_event.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/bloc/contact/contact_state.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/widgets/application_app_bar.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/widgets/contact_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contact_keeper/core/util/input_validator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationAppBar(),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (_, state) {
          if (state is ContactLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is ContactReady) {
            List<ContactEntity> contacts = state.contacts!;
            if (contacts.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                      "Your contact list is empty! Click the floating button to add some contacts."),
                ),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                ContactEntity contact = contacts[index];
                return ContactTile(
                  contact: contact,
                );
              },
              itemCount: contacts.length,
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                TextEditingController nameController = TextEditingController();
                TextEditingController phoneNumberController =
                    TextEditingController();
                TextEditingController emailController = TextEditingController();
                TextEditingController addressController =
                    TextEditingController();
                final formKey = GlobalKey<FormState>();
                return AlertDialog(
                  insetPadding: const EdgeInsets.all(10),
                  scrollable: true,
                  title: const Text('Add New Contacts'),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: validateName,
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              icon: Icon(Icons.account_box),
                            ),
                          ),
                          TextFormField(
                            controller: phoneNumberController,
                            validator: validatePhone,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              icon: Icon(Icons.phone),
                            ),
                          ),
                          TextFormField(
                            validator: validateEmail,
                            controller: emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              icon: Icon(Icons.email),
                            ),
                          ),
                          TextFormField(
                            controller: addressController,
                            decoration: const InputDecoration(
                              labelText: 'Address',
                              icon: Icon(Icons.house),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    ElevatedButton(
                        child: const Text("Submit"),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            _addContacts(
                                context,
                                nameController.text,
                                phoneNumberController.text,
                                emailController.text,
                                addressController.text);
                            Navigator.pop(context);
                          }
                        })
                  ],
                );
              });
        },
      ),
    );
  }

  void _addContacts(BuildContext context, String name, String phoneNumber,
      String email, String address) {
    BlocProvider.of<ContactBloc>(context).add(CreateContact(ContactEntity(
        name: trimString(name),
        phone: trimString(phoneNumber),
        email: trimString(email),
        address: trimString(address))));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Contact saved successfully'),
      ),
    );
  }

  String trimString(String input) {
    return input.trim();
  }
}
