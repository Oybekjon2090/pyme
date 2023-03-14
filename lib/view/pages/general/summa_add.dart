// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:pyme/controller/cards_controller.dart';
import 'package:pyme/domen/model/ccard_model.dart';
import 'package:pyme/view/pages/home/info_page.dart';

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
                      style: Theme.of(context).textTheme.displaySmall,
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
                      style: Theme.of(context).textTheme.displaySmall,
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
                                arxivId: '',
                                date: date.text,
                                summaKomment: summaKomment.text, summa: int.parse(mahsulotSummasi.text),
                                
                              ),
                              docId: widget.docId,
                              infos: widget.info,
                              onSuccess: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          content: LottieBuilder.asset(
                                              'assets/images/done1.png'),
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
                          }
                        },
                        child: const Text('Save'))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
