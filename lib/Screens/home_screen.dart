import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappdio/Cubit/cubit.dart';
import 'package:newsappdio/Cubit/states.dart';
import 'package:newsappdio/Network/dio_helper.dart';
import 'package:newsappdio/Screens/search_screen.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("News"),
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  }),
              IconButton(
                  icon: Icon(NewsCubit.get(context).isDark
                      ? Icons.brightness_2_outlined
                      : Icons.wb_sunny),
                  onPressed: () {
                    NewsCubit.get(context).changeTheme();
                  })
            ],
          ),
          body: NewsCubit.get(context)
              .screens[NewsCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: NewsCubit.get(context).currentIndex,
            onTap: (index) {
              NewsCubit.get(context).changeIndex(index);
            },
            items: NewsCubit.get(context).navBottom,
          ),
        );
      },
    );
  }
}
