import 'package:contact_keeper/features/contact_keeper/presentation/pages/editing_page.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:flutter/material.dart';

class ContactTile extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String email;
  final String address;

  const ContactTile(
      {super.key,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.address});

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
            child: RandomAvatar(widget.name + widget.phoneNumber,
                height: 50, width: 50)),
        title: Text(
          widget.name,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(widget.phoneNumber),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75.0, vertical: 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.email == '' ? 'No email' : widget.email),
                  const SizedBox(height: 5),
                  Text(widget.address == '' ? 'No Address' : widget.address),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const EditingPage(),
                          ),
                        )
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
}

// ListTile(
//         selected: isSelected,
//         leading: CircleAvatar(
//             child: RandomAvatar(widget.name + widget.phoneNumber,
//                 height: 50, width: 50)),
//         title: Text(
//           widget.name,
//           overflow: TextOverflow.ellipsis,
//         ),
//         subtitle: Text(widget.phoneNumber),
//         onTap: () => {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (_) => EditingPage(
//                 name: widget.name,
//                 phoneNumber: widget.phoneNumber,
//               ),
//             ),
//           )
//         },
//         onLongPress: () => {
//           setState(() {
//             isSelected = !isSelected;
//           })
//         },
//       ),