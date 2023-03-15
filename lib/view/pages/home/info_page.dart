// ignore_for_file: non_constant_identifier_names, unused_local_variable, sort_child_properties_last

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:pyme/domen/model/ccard_model.dart';
import 'package:pyme/domen/model/summa_model.dart';
import 'package:pyme/view/pages/home_page.dart';
import 'package:pyme/view/style/style.dart';

import '../../../controller/cards_controller.dart';

import 'summa_add.dart';
import 'edit_card.dart';

class Infos extends StatefulWidget {
  final CardModel infos;

  final String docId;
  Infos({super.key, required this.infos, required this.docId});

  @override
  State<Infos> createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CardController>().getArxiv(docId: widget.infos.docId ?? '');
    });

    super.initState();
  }

  bool useBackgroundImage = false;
  bool useGlassMorphism = false;

  @override
  Widget build(BuildContext context) {
    var event = context.watch<CardController>();
    var state = context.read<CardController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('infos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => EditeCard(
                          info: widget.infos,
                        )));
              },
              icon: const Icon(Icons.edit)),
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Delete"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 1) {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Text(
                          "waiting_delete",
                          style: Style.textStyleRegular(
                              textColor: Style.blackColor),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Yoq",
                            ),
                          ),
                          state.deleteLoading
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: () {
                                    state.deleteUser(
                                      docId: widget.infos.docId ?? '',
                                      onSuccess: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (a) =>
                                                      const HomePage(),
                                                ),
                                                (route) => false);
                                      },
                                    );
                                  },
                                  child: const Text(
                                    "Xa",
                                  ),
                                )
                        ],
                      ));
            }
          }),
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
          Expanded(
            child: event.arxivLoading
                ? Center(
                    child: LoadingAnimationWidget.hexagonDots(
                        color: Style.primaryColor, size: 45))
                : ListView.builder(
                    itemCount:
                        context.read<CardController>().listOfArxiv.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(24),
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Style.greyColor90,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'kiritilgan summa: ${context.read<CardController>().listOfArxiv[index].summa ?? 0}',
                                style: Style.textStyleRegular(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                'Data: ${context.read<CardController>().listOfArxiv[index].date ?? ''}',
                                style: Style.textStyleRegular(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                'Koment: ${context.read<CardController>().listOfArxiv[index].summaKomment ?? ''}',
                                style: Style.textStyleRegular(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Style.primaryColor,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (a) => AddSummaPage(
                docId: widget.docId,
                info: widget.infos,
              ),
            ),
          );
        },
        child: const Icon(Icons.add, color: Style.whiteColor),
      ),
    );
  }
}
