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
  ContactModel contact1 = ContactModel(isVisible: false, name: "", phone: "");
  ContactModel contact2 = ContactModel(isVisible: false, name: "", phone: "");
  ContactModel contact3 = ContactModel(isVisible: false, name: "", phone: "");
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
        title: const Text("Contacts Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  title: "Enter Your Number Here",
                  controller: phoneController,
                  type: TextInputType.phone,
                  action: TextInputAction.done,
                  icon: Icons.phone,
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            if (contact1.isVisible == false) {
                              contact1.isVisible = true;
                              contact1.name = nameController.text;
                              contact1.phone = phoneController.text;
                              nameController.clear();
                              phoneController.clear();
                            } else if (contact2.isVisible == false) {
                              contact2.isVisible = true;
                              contact2.name = nameController.text;
                              contact2.phone = phoneController.text;
                              nameController.clear();
                              phoneController.clear();
                            } else {
                              contact3.isVisible = true;
                              contact3.name = nameController.text;
                              contact3.phone = phoneController.text;
                              nameController.clear();
                              phoneController.clear();
                            }
                            setState(() {});
                          }
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
                          if (contact3.isVisible == true) {
                            contact3.isVisible = false;
                          } else if (contact2.isVisible == true) {
                            contact2.isVisible = false;
                          } else {
                            contact1.isVisible = false;
                          }
                          setState(() {});
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
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ContactItem(contact: contact1),
                const SizedBox(height: 30),
                ContactItem(contact: contact2),
                const SizedBox(height: 30),
                ContactItem(contact: contact3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
