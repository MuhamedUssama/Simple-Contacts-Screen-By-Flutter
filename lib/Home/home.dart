import 'package:assignement_3/Home/contact_item.dart';
import 'package:assignement_3/Home/custom_textfield.dart';
import 'package:assignement_3/Home/model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = "home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController nameController;
  late TextEditingController phoneController;

  List<ContactModel> contacts = [];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Contacts Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              CustomTextFormField(
                title: "Enter Your Name Here",
                controller: nameController,
                type: TextInputType.name,
                action: TextInputAction.next,
                icon: Icons.edit,
                validatorMessage: 'Please enter your name',
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                title: "Enter Your Number Here",
                controller: phoneController,
                type: TextInputType.phone,
                action: TextInputAction.done,
                icon: Icons.phone,
                validatorMessage: 'Please enter your phone',
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        addButton();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.all(16)),
                      child: const Text(
                        "Add",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        deleteButton();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ContactItem(contact: contacts[index]),
                  ),
                  itemCount: contacts.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addButton() {
    if (formKey.currentState?.validate() ?? false) {
      contacts.add(
        ContactModel(
          name: nameController.text,
          phone: phoneController.text,
        ),
      );
      nameController.clear();
      phoneController.clear();

      setState(() {});
    }
  }

  void deleteButton() {
    if (contacts.isNotEmpty) {
      contacts.removeLast();
      setState(() {});
    }
  }
}
