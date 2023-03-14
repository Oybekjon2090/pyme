import 'package:flutter/material.dart';
import '../../components/card_widget.dart';



class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddCardState();
  }
}

class AddCardState extends State<AddCard> {
  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold(resizeToAvoidBottomInset: false, body: CardWidget());
  }
}
