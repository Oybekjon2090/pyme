import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';
import 'package:pyme/controller/cards_controller.dart';
import 'package:pyme/domen/model/ccard_model.dart';
import 'package:pyme/view/pages/home_page.dart';

import '../components/custom_textform.dart';
import '../components/onUnfocusTab.dart';

class CardAdd extends StatefulWidget {
  const CardAdd({super.key});

  @override
  State<CardAdd> createState() => _CardAddState();
}

class _CardAddState extends State<CardAdd> {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController cardHolderName = TextEditingController();
  TextEditingController cvvCode = TextEditingController();
  final GlobalKey<FormState> addUserKey = GlobalKey<FormState>();
  String? isCvvFocused;

  @override
  void dispose() {
    cardNumber.dispose();
    expiryDate.dispose();
    cardHolderName.dispose();
    cvvCode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<CardController>();

    return Scaffold(
      appBar: AppBar(title: Text('Card')),
      body: SingleChildScrollView(
        child: Column(children: [
          CreditCardWidget(
            cardNumber: cardNumber.text,
            expiryDate: expiryDate.text,
            cardHolderName: cardHolderName.text,
            cvvCode: cvvCode.text,
            showBackView: true,
            onCreditCardWidgetChange:
                (CreditCardBrand) {}, //true when you want to show cvv(back) view
          ),
          CustomTextFrom(
              controller: cardNumber, hintext: 'cardNumber', isObscure: false),
          CustomTextFrom(
              controller: expiryDate, hintext: 'expiryDate', isObscure: false),
          CustomTextFrom(
              controller: cardHolderName,
              hintext: 'cardHolderName',
              isObscure: false),
          CustomTextFrom(
              controller: cvvCode, hintext: 'cvvCode', isObscure: false),
        ]),
      ),
    );
  }
}
