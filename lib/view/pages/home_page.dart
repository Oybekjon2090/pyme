import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:pyme/controller/cards_controller.dart';
import 'package:pyme/domen/model/ccard_model.dart';
import 'package:pyme/view/pages/general/general_page.dart';

import 'package:pyme/view/pages/home/add_card.dart';
import 'package:pyme/view/pages/home/edit_card.dart';
import 'package:pyme/view/pages/home/info_page.dart';

import '../style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CardController>().getCards();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var event = context.watch<CardController>();
    var state = context.read<CardController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card"),
      ),
      body: event.createCardLoading
          ? Center(
              child: LoadingAnimationWidget.hexagonDots(
                  color: Style.primaryColor, size: 45))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (a) => Infos(infos: state.list[index]),
                            ),
                          );
                        },
                        child: CreditCardWidget(
                          cardNumber: state.list[index].number ?? '',
                          expiryDate: state.list[index].data ?? '',
                          cardHolderName: state.list[index].name ?? '',
                          cvvCode: state.list[index].svv ?? '',
                          showBackView: false,
                          bankName: state.list[index].name ?? '',
                          isSwipeGestureEnabled: true,
                          isChipVisible: true,
                          onCreditCardWidgetChange:
                              (CreditCardBrand) {}, //true when you want to show cvv(back) view
                        ),
                      );
                    },
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => AddCard()));
                  },
                  child: Text('Add'),
                ),
                20.verticalSpace
              ],
            ),
    );
  }
}
