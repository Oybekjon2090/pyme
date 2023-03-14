import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:pyme/domen/model/ccard_model.dart';

import 'edit_card.dart';

class Infos extends StatelessWidget {
  final CardModel infos;
  Infos({super.key, required this.infos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('infos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => EditeCard(
                          info: infos,
                        )));
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: Center(
        child: CreditCardWidget(
          cardNumber: infos.number ?? '',
          expiryDate: infos.data ?? '',
          cardHolderName: infos.name ?? '',
          cvvCode: infos.svv ?? '',
          showBackView: false,
          bankName: infos.name ?? '',
          
          isSwipeGestureEnabled: true,
          isChipVisible: true,
          onCreditCardWidgetChange:
              (CreditCardBrand) {}, //true when you want to show cvv(back) view
        ),
      ),
    );
  }
}
