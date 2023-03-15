// 𝓙𝓪𝓫𝓲𝓴𝓙𝓪𝓷🖤, [15.03.2023 15:19]
// import 'dart:convert';

// import 'package:cardsnew/application/cubit/filter_cubit.dart';
// import 'package:cardsnew/application/cubit/history_cubit.dart';
// import 'package:cardsnew/presentation/styles/colors.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';

// import 'package:http/http.dart' as http;

// class CardToCard extends StatefulWidget {
//   const CardToCard({super.key});

//   @override
//   State<CardToCard> createState() => _CardToCardState();
// }

// class _CardToCardState extends State<CardToCard> {
//   @override
//   void initState() {
//     getToken();
//     super.initState();
//   }

//   String? fcmToken = "";
//   Future<void> getToken() async {
//     await FirebaseMessaging.instance.requestPermission(
//       alert: true,
//       sound: true,
//     );
//     fcmToken = await FirebaseMessaging.instance.getToken();
//     print(fcmToken);
//     FirebaseMessaging.onMessage.listen((event) {
//       print(event.data);
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     event.data["body"] ?? "body",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   Text(event.data["title"] ?? "title",
//                       style: TextStyle(color: Colors.black)),
//                 ],
//               ),
//             );
//           });
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       print("onMessageOpenedApp : $event");
//     });

//     FirebaseMessaging.onBackgroundMessage((message) {
//       print("onBackgroundMessage : $message");
//       return Future.value();
//     });
//   }

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController _namecontroller = TextEditingController();
//   final TextEditingController costcontroller = TextEditingController();
//   final TextEditingController _cardcontroller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: BlocBuilder<FilterCubit, Filterstate>(
//         builder: (context, stat) {
//           return BlocBuilder<HistoryCubit, HistoryState>(
//             builder: (context, state) {
//               return Scaffold(
//                 resizeToAvoidBottomInset: false,
//                 appBar: AppBar(
//                   elevation: 0,
//                   title: Text(
//                     'Pul Utqazish',
//                     style: Style.qopqora(),
//                   ),
//                   backgroundColor: Colors.grey,
//                 ),
//                 body: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Lottie.asset('images/money.json'),
//                         24.verticalSpaceFromWidth,
//                         TextFormField(
//                           validator: (s) {
//                             if (s?.isEmpty ?? true) {
//                               return "Karta Raqamni Kiriting";
//                             }
//                             return null;
//                           },
//                           // ignore: prefer_const_constructors
//                           decoration: const InputDecoration(
//                               hintText: 'Karta Raqam Kiriting'),
//                           maxLength: 16,
//                           controller: _cardcontroller,
//                         ),
//                         24.verticalSpaceFromWidth,
//                         TextFormField(
//                           validator: (s) {
//                             if (s?.isEmpty ?? true) {

// 𝓙𝓪𝓫𝓲𝓴𝓙𝓪𝓷🖤, [15.03.2023 15:19]
// return "Ismni kiriting Kiriting";
//                             }
//                             return null;
//                           },
//                           // ignore: prefer_const_constructors
//                           decoration:
//                               const InputDecoration(hintText: 'Isimni kiritng'),
//                           controller: _namecontroller,
//                         ),
//                         24.verticalSpaceFromWidth,
//                         TextFormField(
//                           validator: (s) {
//                             if (s?.isEmpty ?? true) {
//                               return "Miqdorni Kiriting";
//                             }
//                             return null;
//                           },
//                           // ignore: prefer_const_constructors
//                           decoration: const InputDecoration(
//                               fillColor: Colors.blue,
//                               hintText: 'Miqdorni kiriting'),
//                           keyboardType: TextInputType.number,
//                           controller: costcontroller,
//                         ),
//                         24.verticalSpaceFromWidth,
//                         GestureDetector(
//                           onTap: () {
//                             if ((formKey.currentState?.validate() ?? false) &&
//                                 stat.cards?[0].allcost != null) {
//                               context.read<HistoryCubit>().addAlldatas(
//                                   name1: _namecontroller.text,
//                                   name: stat.cards?.first.name,
//                                   doc: '4VZqvnyfIcmwnTMppeD5',
//                                   cost: int.parse(costcontroller.text),
//                                   number: stat.cards?.first.number,
//                                   type: 'Visa',
//                                   chiqdi: stat.cards?.first.chiqdi,
//                                   kirdi: stat.cards?.first.kirdi,
//                                   card: _cardcontroller.text,
//                                   cvv: stat.cards?.first.cvv,
//                                   imgeindex: stat.cards?.first.imgeindex,
//                                   allcost: stat.cards?.first.allcost);
//                               http.post(
//                                 Uri.parse(
//                                     "https://fcm.googleapis.com/fcm/send"),
//                                 headers: {
//                                   "Content-Type": "application/json",
//                                   'Authorization':
//                                       'key=AAAAJtjzW0U:APA91bE_plwjQO6ZIUbFF5yYtMBIeYzgcz84jO5PUWyCILXZilobrzIuAEFUWnZgSgza_cQ9z6tuRR0DRgIqDY-qcnTmbOqR1kHVXHKCel5LGSHAOwHEUUHqowEk49sv0gRaSJAGwdID'
//                                 },
//                                 body: jsonEncode(
//                                   {
//                                     "to": fcmToken,
//                                     "data": {
//                                       "body":
//                                           "Sizning kartangizdan ${costcontroller.text} summa yechib olindi",
//                                       "title": "Biz bn ishlaganiz raxmat !!!"
//                                     }
//                                   },
//                                 ),
//                               );
//                             } else {
//                               showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return AlertDialog(
//                                     actions: <Widget>[
//                                       Lottie.network(
//                                           'https://assets10.lottiefiles.com/packages/lf20_8zle4p5u.json'),
//                                       Center(
//                                         child: Text(
//                                           "Mablag' Yetarli emas",
//                                           style: Style.qopqora(),

// ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             }
//                           },
//                           child: Container(
//                             decoration: Style.addushi(textColor: Colors.blue),
//                             height: 50,
//                             width: double.infinity,
//                             child: Center(
//                               child: Text(
//                                 'Send Money',
//                                 style: Style.qopqora(),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }