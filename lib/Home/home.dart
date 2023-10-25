import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = "home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Contacts Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  border: InputBorder.none,
                  hintText: 'Enter Your Name Here',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: Icon(Icons.edit, color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const TextField(
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  border: InputBorder.none,
                  hintText: 'Enter Your Number Here',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: Icon(Icons.phone, color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
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
                    onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
