import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:pyme/domen/model/ccard_model.dart';
import 'package:pyme/view/style/style.dart';

import 'edit_card.dart';

class Infos extends StatefulWidget {
  final CardModel infos;
  const Infos({super.key, required this.infos});

  @override
  State<Infos> createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  bool useBackgroundImage = false;
  bool useGlassMorphism = false;

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
                          info: widget.infos,
                        )));
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: Column(
        children: [
          CreditCardWidget(
            backgroundImage:
                useBackgroundImage ? 'assets/images/card.png' : null,
            cardNumber: widget.infos.number ?? '',
            expiryDate: widget.infos.data ?? '',
            cardHolderName: widget.infos.name ?? '',
            cvvCode: widget.infos.svv ?? '',
            showBackView: false,
            bankName: widget.infos.name ?? '',

            isSwipeGestureEnabled: true,
            isChipVisible: true,

            onCreditCardWidgetChange:
                (CreditCardBrand) {}, //true when you want to show cvv(back) view
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Card Image',
                  style: TextStyle(
                    color: Style.blackColor,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Switch(
                  value: useBackgroundImage,
                  inactiveTrackColor: Colors.grey,
                  activeColor: Colors.white,
                  activeTrackColor: Colors.amber,
                  onChanged: (bool value) => setState(() {
                    useBackgroundImage = value;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
