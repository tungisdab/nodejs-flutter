import 'package:flutter/material.dart';
import 'package:nodejs_sv_fl/services/api.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var desController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFF8CDDA),
                Color.fromARGB(255, 103, 130, 239),
              ],
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2),
                  blurRadius: 10,
                  spreadRadius: 1)
            ]),
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: "name"),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(hintText: "price"),
            ),
            TextField(
              controller: desController,
              decoration: InputDecoration(hintText: "description"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  var data = {
                    "pname": nameController.text,
                    "pprice": priceController.text,
                    "pdesc": desController.text,
                  };

                  Api.addproduct(data);
                },
                child: Text("CREATE DATA")),
          ],
        ),
      ),
    );
  }
}
