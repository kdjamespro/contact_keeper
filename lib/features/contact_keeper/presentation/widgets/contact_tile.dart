import 'package:contact_keeper/features/contact_keeper/domain/entities/contact_entity.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/bloc/contact/contact_bloc.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/bloc/contact/contact_event.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/pages/editing_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:flutter/material.dart';

class ContactTile extends StatefulWidget {
  final ContactEntity contact;
  const ContactTile({super.key, required this.contact});

  @override
  State<ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        leading: CircleAvatar(
            child: RandomAvatar(widget.contact.name + widget.contact.phone,
                height: 50, width: 50)),
        title: Text(
          widget.contact.name,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(widget.contact.phone),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75.0, vertical: 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.contact.email == ''
                      ? 'No email'
                      : widget.contact.email),
                  const SizedBox(height: 5),
                  Text(widget.contact.address == ''
                      ? 'No Address'
                      : widget.contact.address),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () => {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => EditingPage(
                              contact: widget.contact,
                            ),
                          ),
                        )
                            .then((value) {
                          bool show = value ?? false;
                          if (show) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Contact updated successfully'),
                              ),
                            );
                          }
                        })
                      },
                  icon: const Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            insetPadding: const EdgeInsets.all(10),
                            scrollable: true,
                            title: const Text('Delete Contact'),
                            content: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    'Do you want to delete the selected contacts?')),
                            actions: [
                              ElevatedButton(
                                  child: const Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              ElevatedButton(
                                  child: const Text("Yes"),
                                  onPressed: () {
                                    _deleteContact(context, widget.contact);
                                    Navigator.pop(context);
                                  })
                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.delete))
            ],
          )
        ],
      ),
    );
  }

  void _deleteContact(BuildContext context, ContactEntity contact) {
    BlocProvider.of<ContactBloc>(context).add(DeleteContact(contact));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Contact deleted successfully'),
      ),
    );
  }
}
