import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappdio/Cubit/cubit.dart';
import 'package:newsappdio/Cubit/states.dart';
import 'package:newsappdio/Shared_Ui/News_Item.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          var list = cubit.search;
          return Scaffold(
       //     appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.only(top:60,right: 3,left: 3,bottom: 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      autocorrect: true,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                          labelText: 'Search',
                          prefix: Icon(Icons.search),
                          border: OutlineInputBorder(
                            gapPadding: 6,
                            borderRadius: BorderRadius.circular(30),
                          )),
                      onChanged: (String value) {
                        cubit.getSearch(value);
                      },
                      controller: NewsCubit.get(context).searchController,
                    ),
                  ),
                  if (state is NewsSearchSuccessLoadingState)
                    Center(child: CircularProgressIndicator()),
                  Expanded(
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) =>
                            newsItem(list[index], context)),
                  )
                ],
              ),
            ),
          );
        });
  }
}
