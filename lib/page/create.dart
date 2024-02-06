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
            ElevatedButton(onPressed: () {
              var data = {
                "pname": nameController.text,
                "pprice": priceController.text,
                "pdes": desController.text,
              };

              Api.addproduct(data);
            }, child: Text("CREATE DATA")),
          ],
        ),
      ),
    );
  }
}
