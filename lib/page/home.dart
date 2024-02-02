import 'package:flutter/material.dart';
import 'package:nodejs_sv_fl/page/create.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Create()));
          }, child: Text("CREATE")),
          ElevatedButton(onPressed: () {}, child: Text("READ")),
          ElevatedButton(onPressed: () {}, child: Text("UPDATE")),
          ElevatedButton(onPressed: () {}, child: Text("DELETE")),
        ],
      ),
    );
  }
}
