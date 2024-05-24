
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../layout/news_cubit.dart';
import '../layout/news_states.dart';
import '../shared/components.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NewsCubit,NewsStates>(
      builder: (context,state){
        var list = NewsCubit.get(context).sport;
        return articleBuilder(list,context);
      },

    );

  }
}
