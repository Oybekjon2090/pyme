// ignore_for_file: unused_local_variable, depend_on_referenced_packages

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';
import 'package:pyme/controller/cards_controller.dart';
import 'package:pyme/domen/model/ccard_model.dart';
import 'package:pyme/view/pages/home/info_page.dart';
import 'package:pyme/view/style/style.dart';
import 'package:http/http.dart' as http;

import '../../../domen/model/summa_model.dart';
import '../../components/custom_textform.dart';
import '../../components/data_picer.dart';
import '../../components/onUnfocusTab.dart';

class AddSummaPage extends StatefulWidget {
  final CardModel info;
  final String docId;
  const AddSummaPage({super.key, required this.docId, required this.info});

  @override
  State<AddSummaPage> createState() => _AddSummaPageState();
}

class _AddSummaPageState extends State<AddSummaPage> {
   @override
  void initState() {
    getToken();
    super.initState();
  }

  String? fcmToken = "";
  Future<void> getToken() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      sound: true,
    );
    fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);
    FirebaseMessaging.onMessage.listen((event) {
      print(event.data);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    event.data["body"] ?? "body",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(event.data["title"] ?? "title",
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            );
          });
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("onMessageOpenedApp : $event");
    });

    FirebaseMessaging.onBackgroundMessage((message) {
      print("onBackgroundMessage : $message");
      return Future.value();
    });
  }

  TextEditingController mahsulotSummasi = TextEditingController();
  TextEditingController qarzi = TextEditingController();
  TextEditingController summaKomment = TextEditingController();
  TextEditingController date = TextEditingController();
  final GlobalKey<FormState> addSummaKey = GlobalKey<FormState>();

  @override
  void dispose() {
    mahsulotSummasi.dispose();
    qarzi.dispose();
    summaKomment.dispose();
    date.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<CardController>();
    final event = context.watch<CardController>();

    return OnUnFocusTap(
      child: Scaffold(
          appBar: AppBar(
            iconTheme:
                IconThemeData(color: Theme.of(context).unselectedWidgetColor),
            title: Text(
              "add_debt",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: addSummaKey,
                child: Column(
                  children: [
                    24.verticalSpace,
                    CustomTextFrom(
                      validator: (s) {
                        if (s?.isEmpty ?? true) {
                          return "summasi";
                        }
                        return null;
                      },
                      hintext: '',
                      label: "summasi",
                      isObscure: false,
                      keyboardType: TextInputType.number,
                      controller: mahsulotSummasi,
                    ),
                    24.verticalSpace,
                    CustomTextFrom(
                      validator: (s) {
                        if (s?.isEmpty ?? true) {
                          return "summa_komment";
                        }
                        return null;
                      },
                      hintext: '',
                      label: "summa_komment",
                      isObscure: false,
                      controller: summaKomment,
                    ),
                    24.verticalSpace,
                    DatePicker(
                      controller: date,
                    ),
                    50.verticalSpace,
                    GestureDetector(
                        onTap: () {
                          if (addSummaKey.currentState?.validate() ?? false) {
                            state.addSumma(
                              info: SummaModel(
                                date: date.text,
                                summaKomment: summaKomment.text,
                                summa: int.parse(mahsulotSummasi.text), arxivId: '',
                              ),
                              
                              docId: widget.docId,
                              infos: widget.info,
                              onSuccess: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: Text('Sacssesful'),
                                          content: Image.asset(
                                              'assets/images/done1.png',
                                              width: 100,
                                              height: 100,),
                                        ));
                                Future.delayed(const Duration(seconds: 1), () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (_) => Infos(
                                          docId: widget.docId,
                                          infos: widget.info,
                                        ),
                                      ),
                                      (route) => false);
                                });
                              },
                            );
                            http.post(
                                Uri.parse(
                                    "https://fcm.googleapis.com/fcm/send"),
                                headers: {
                                  "Content-Type": "application/json",
                                  'Authorization':
                                      'key=AAAAc-n3_U8:APA91bH-hV8B9MY2jTiHhJe9WoIWGYnRqULSBWNZla41dLFwxCpYmrb13Mi2081i3IMm-sRVXCwf0yLRrZ-8oDwlnoeK0YWjsgWl7Rlz0O450K_ulpNN1ptKdxwP9E3L-Ut4_OIDRJjm'
                                },
                                body: jsonEncode(
                                  {
                                    "to": fcmToken,
                                    "data": {
                                      "body":
                                          "Sizning kartangizga ${mahsulotSummasi.text} summa qabul qilindi",
                                      "title": "Biz bn ishlaganiz raxmat !!!"
                                    }
                                  },
                                ),
                             
                              );
                            
                          }else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: <Widget>[
                                      Lottie.network(
                                          'https://assets10.lottiefiles.com/packages/lf20_8zle4p5u.json'),
                                      const Center(
                                        child: Text(
                                          "Mablag' Yetarli emas",
                                          style: TextStyle(color: Style.primaryColor),

),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                        },
                        child: Container(
                            height: 50.h,
                            width: 200.w,
                            decoration: BoxDecoration(
                                color: Style.primaryColor,
                                borderRadius: BorderRadius.circular(16)),
                            child: Center(child: const Text('Save'))))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
