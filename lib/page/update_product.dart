import 'package:flutter/material.dart';
import 'package:nodejs_sv_fl/model/product_model.dart';
import 'package:nodejs_sv_fl/services/api.dart';

class UpdateProduct extends StatefulWidget {
  final Product data;
  const UpdateProduct({super.key, required this.data});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var desController = TextEditingController();
  late final int id;
  
  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name.toString();
    priceController.text = widget.data.price.toString();
    desController.text = widget.data.desc.toString();
  }

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
                    Api.updateProduct(widget.data.id!, {
                      'id': widget.data.id,
                      "pname": nameController.text,
                      'pdesc': desController.text,
                      'pprice': priceController.text,
                    });
                  },
                  child: Text("UPDATE"),
                ),
              ],
            ),
      ),
    );
  }
}