import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:provider/provider.dart';
import 'package:pyme/controller/cards_controller.dart';
import 'package:pyme/view/pages/home/add_card.dart';

import '../../style/style.dart';
import '../home_page.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  List<Widget> mainPages = [
    const HomePage(),
    const AddCard(),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainPages[context.watch<CardController>().currentIndex],
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: SnakeNavigationBar.color(
        snakeViewColor: Style.primaryColor,
        // selectedItemColor: Style.primaryColor,
        unselectedItemColor: Style.greyColor90,
        currentIndex: context.watch<CardController>().currentIndex,
        onTap: (value) {
          context.read<CardController>().setIndex(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 25,
              color: Theme.of(context).unselectedWidgetColor,
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.group_add_sharp,
            size: 25,
            color: Theme.of(context).unselectedWidgetColor,
          )),
        ],
      ),
    );
  }
}
