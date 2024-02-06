import 'package:flutter/material.dart';
import 'package:nodejs_sv_fl/model/product_model.dart';
import 'package:nodejs_sv_fl/services/api.dart';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
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
                return Center(
                  child: CircularProgressIndicator(
                    
                  ),
                );
              } else {
                List<Product> pdata = snapshot.data;
                return ListView.builder(
                  itemCount: pdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.storage),
                      title: Text(
                        "${pdata[index].name}"
                      ),
                      subtitle: Text(
                        "${pdata[index].desc}"
                      ),
                      trailing: Text(
                        "\$ ${pdata[index].price}"
                      ),
                    );
                  },
                );  

              }
            }
          ),
      ),
    );
  }
}