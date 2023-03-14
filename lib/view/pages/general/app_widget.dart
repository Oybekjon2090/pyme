import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pyme/controller/cards_controller.dart';
import 'package:pyme/view/pages/home_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
  // ignore: library_private_types_in_public_api
  static _AppWidgetState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppWidgetState>();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => CardController()),
            ],
            child: MaterialApp(
              theme: ThemeData(
                useMaterial3: true,
              ),
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            ),
          );
        });
      
  }
}
