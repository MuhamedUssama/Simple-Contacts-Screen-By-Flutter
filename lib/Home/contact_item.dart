import 'package:assignement_3/Home/model.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  ContactModel contact = ContactModel(isVisible: false, name: "", phone: "");
  ContactItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: contact.isVisible,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Column(
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
      ),
    );
  }
}
