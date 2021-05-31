import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappdio/Cubit/cubit.dart';
import 'package:newsappdio/Cubit/states.dart';
import 'package:newsappdio/Shared_Ui/News_Item.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          if(state is NewsBusinessSuccessLoadingState){return Center(child: CircularProgressIndicator());}else
          return ListView.builder(
            itemBuilder: (context, index) => newsItem(cubit.business[index],context),
            itemCount: cubit.business.length,
          );
        },
      ),
    );
  }
}
