import 'package:flutter/material.dart';
import 'package:pyme/view/components/custom_textform.dart';
import 'package:pyme/view/pages/add_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card")),
      body: Column(
        children: [
         
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => CardAdd()));
            },
            child: Text('add'),
          )
        ],
      ),
    );
  }
}
