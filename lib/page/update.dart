import 'package:flutter/material.dart';
import 'package:nodejs_sv_fl/model/product_model.dart';
import 'package:nodejs_sv_fl/page/update_product.dart';
import 'package:nodejs_sv_fl/services/api.dart';

class Update extends StatefulWidget {
  const Update({
    super.key,
  });

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
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
          child: FutureBuilder(
              future: Api.getProduct(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  List<Product> pdata = snapshot.data;
                  return ListView.builder(
                      itemCount: pdata.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Icon(Icons.storage),
                          title: Text("${pdata[index].name}"),
                          subtitle: Text("${pdata[index].desc} // id: ${pdata[index].id}"),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProduct(data: pdata[index])));
                            },
                          ),
                        );
                      });
                }
              })),
    );
  }
}
