import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappdio/Cubit/cubit.dart';
import 'package:newsappdio/Network/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Cubit/bloc_obsirve.dart';
import 'Cubit/states.dart';
import 'Network/chash_helper.dart';
import 'Screens/Splash_Screen.dart';
import 'Screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  bool isDark = CashHelper.getData(key: "isDark");
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (BuildContext context) => NewsCubit()
        ..getBusiness()..getScience()..getSports()
        ..changeTheme(fromShared: isDark),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  cardColor: Colors.white,
                  primarySwatch: Colors.orange,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    centerTitle: true,
                      backgroundColor: Colors.white,
                      iconTheme: IconThemeData(color: Colors.orange),
                      titleTextStyle: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      //   backgroundColor: Colors.white,
                      elevation: 0,
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.dark,
                        statusBarColor: Colors.white,
                      )),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: Colors.white,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.orange,
                      unselectedItemColor: Colors.grey,
                      elevation: 30),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18))),
              darkTheme: ThemeData(

                  cardColor: HexColor("333739"),
                  primarySwatch: Colors.orange,
                  scaffoldBackgroundColor: HexColor("333739"),
                  appBarTheme: AppBarTheme(
                    centerTitle: true,
                      backgroundColor: HexColor("333739"),
                      iconTheme: IconThemeData(color: Colors.orange),
                      titleTextStyle: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      elevation: 0,
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.light,
                        statusBarColor: HexColor("333739"),
                      )),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: HexColor("333739"),
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.orange,
                      unselectedItemColor: Colors.grey,
                      elevation: 30),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18))),
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: SplashScreeen(),
            );
          }),
    );
  }
}
