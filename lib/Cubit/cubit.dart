import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappdio/Cubit/states.dart';
import 'package:newsappdio/Network/chash_helper.dart';
import 'package:newsappdio/Network/dio_helper.dart';
import 'package:newsappdio/Screens/Nav_Tabs/Business.dart';
import 'package:newsappdio/Screens/Nav_Tabs/Scince.dart';
import 'package:newsappdio/Screens/Nav_Tabs/Sports.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];
  List<BottomNavigationBarItem> navBottom = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  void getBusiness() {
    emit(NewsBusinessSuccessLoadingState());
    if (science.length == 0) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "business",
        "apiKey": "731b369823d2482cb51a6ca5eac0a200",
      }).then((value) {
        business = value.data["articles"];
        print(business[0]["title"]);
        emit(NewsSGetBusinessSuccessState());
      }).catchError((error) {
        print("error====>>>${error.toString()}");
        emit(NewsSGetBusinessErrorState(error));
      });
    } else {
      emit(NewsSGetBusinessSuccessState());
    }
  }

  void getSports() {
    emit(NewsSportsSuccessLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "sports",
        "apiKey": "731b369823d2482cb51a6ca5eac0a200",
      }).then((value) {
        sports = value.data["articles"];
        print(sports[0]["title"]);
        emit(NewsSGetSportsSuccessState());
      }).catchError((error) {
        print("error====>>>${error.toString()}");
        emit(NewsSGetSportsErrorState(error));
      });
    } else {
      emit(NewsSGetSportsSuccessState());
    }
  }

  void getScience() {
    emit(NewsScienceSuccessLoadingState());
    if (science.length == 0) {
      DioHelper.getData(url: "v2/top-headlines", query: {
        "country": "eg",
        "category": "science",
        "apiKey": "731b369823d2482cb51a6ca5eac0a200",
      }).then((value) {
        science = value.data["articles"];
        print(business[0]["title"]);
        emit(NewsSGetScienceSuccessState());
      }).catchError((error) {
        print("error====>>>${error.toString()}");
        ;
        emit(NewsSGetScienceErrorState(error));
      });
    } else {
      emit(NewsSGetScienceSuccessState());
    }
  }

  bool isDark = true;

  void changeTheme({bool fromShared}) {
    if (fromShared != null)
      isDark = fromShared;
    else
      isDark = !isDark;
    CashHelper.putData(key: "isDark", value: isDark)
        .then((value) => emit(NewsChangeThemeState()));
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsSearchSuccessLoadingState());
    DioHelper.getData(url: "v2/everything", query: {
      "q": "$value",
      "apiKey": "731b369823d2482cb51a6ca5eac0a200",
    }).then((value) {
      search = value.data["articles"];
      emit(NewsSearchSuccessState());
    }).catchError((error) {
      print("error====>>>${error.toString()}");
      ;
      emit(NewsSearchErrorState(error));
    });
  }

  var searchController = TextEditingController();


}
