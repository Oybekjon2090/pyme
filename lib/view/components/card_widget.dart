import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  final GlobalKey<FormState> addUserKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreditCardWidget(
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cardHolderName: cardHolderName,
        cvvCode: cvvCode,
        backgroundImage: 'assets/card_bg.png',
        obscureCardNumber: true,
        obscureInitialCardNumber: true,
        obscureCardCvv: true,
        isHolderNameVisible: false,
        height: 175,
        textStyle: TextStyle(color: Colors.yellowAccent),
        width: MediaQuery.of(context).size.width,
        isChipVisible: true,
        isSwipeGestureEnabled: true,
        animationDuration: Duration(milliseconds: 1000),
        frontCardBorder: Border.all(color: Colors.grey),
        backCardBorder: Border.all(color: Colors.grey),
        onCreditCardWidgetChange: (CreditCardBrand) {
          setState(() {});
        },
        showBackView: true,
      ),
    );
  }
}
