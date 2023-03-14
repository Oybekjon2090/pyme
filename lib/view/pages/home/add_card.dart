import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../components/card_widget.dart';



class AddCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddCardState();
  }
}

class AddCardState extends State<AddCard> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: CardWidget());
  }
}
