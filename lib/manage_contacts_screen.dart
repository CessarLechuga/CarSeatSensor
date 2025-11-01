import 'package:flutter/material.dart';

import 'package:flutter_contacts/flutter_contacts.dart';

// --- We create a simple class to hold the contact info ---
class EmergencyContact {
  final String id;
  final String name;

  EmergencyContact({required this.id, required this.name});
}

// -------------------------------------------------
// MANAGE CONTACTS SCREEN
// -------------------------------------------------

class ManageContactsScreen extends StatefulWidget {
  const ManageContactsScreen({super.key});

  @override
  State<ManageContactsScreen> createState() => _ManageContactsScreenState();
}

class _ManageContactsScreenState extends State<ManageContactsScreen> {
  // This is the list of emergency contacts that your app will save.
  // We start with an empty list.
  final List<EmergencyContact> _emergencyContacts = [
    // ---
    // I've added some example data so you can see how it looks.
    // Delete this when you are ready.
    EmergencyContact(id: '123', name: 'Mom'),
    EmergencyContact(id: '456', name: 'Dad (Mobile)'),
    // ---
  ];

  // --- FUNCTION TO ADD A CONTACT ---
  void _addContact() async {
    // ---
    // THIS IS THE IMPORTANT LOGIC
    // ---
    // 1. Ask the user for permission to view their contacts
    //    (Uncomment this when you install the package)
    // if (await FlutterContacts.requestPermission()) {
    //   // 2. Open the phone's native contact picker
    //   final contact = await FlutterContacts.pickContact(
    //     displayName: true,
    //     phoneNumber: true,
    //   );
    //
    //   if (contact != null) {
    //     // 3. Add the selected contact to our list
    //     setState(() {
    //       _emergencyContacts.add(EmergencyContact(
    //         id: contact.id,
    //         name: contact.displayName,
    //       ));
    //     });
    //   }
    // } else {
    //   // User did not give permission
    //   // (You could show a message here)
    // }

    // ---
    // (You can delete this line below, it's just a placeholder)
    print("Add button pressed. Install flutter_contacts!");
    // ---
  }

  // --- FUNCTION TO DELETE A CONTACT ---
  void _deleteContact(int index) {
    setState(() {
      _emergencyContacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Contacts'),
        actions: [
          // --- ADD BUTTON ---
          IconButton(
            icon: const Icon(Icons.add_call),
            onPressed: _addContact,
            tooltip: 'Add from Contacts',
          ),
        ],
      ),
      body: _emergencyContacts.isEmpty
          ? const Center(
              child: Text(
                'No emergency contacts added.',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          // --- CONTACTS LIST ---
          : ListView.builder(
              itemCount: _emergencyContacts.length,
              itemBuilder: (context, index) {
                final contact = _emergencyContacts[index];
                return ListTile(
                  leading: const Icon(Icons.person, size: 40),
                  title: Text(contact.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Emergency Contact'),
                  // --- DELETE BUTTON ---
                  trailing: IconButton(
                    icon: Icon(Icons.delete_outline, color: Colors.red[700]),
                    onPressed: () => _deleteContact(index),
                    tooltip: 'Delete Contact',
                  ),
                  // (Editing would just take you to your phone's
                  // contacts app, which is more complex)
                );
              },
            ),
    );
  }
}

