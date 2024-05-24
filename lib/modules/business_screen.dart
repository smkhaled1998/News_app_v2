import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/news_cubit.dart';
import '../layout/news_states.dart';
import '../shared/components.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(

      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return articleBuilder(list,context);
      },

    );
  }
}

