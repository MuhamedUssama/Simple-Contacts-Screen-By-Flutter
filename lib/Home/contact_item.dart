import 'package:assignement_3/Home/model.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  ContactModel contact = ContactModel(name: "", phone: "");
  final Function deleteIconFunction;

  ContactItem({
    super.key,
    required this.contact,
    required this.deleteIconFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name: ${contact.name}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "Phone: ${contact.phone}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              deleteIconFunction(contact);
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          )
        ],
      ),
    );
  }
}
