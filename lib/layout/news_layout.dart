import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/business_screen.dart';
import '../modules/science_screen.dart';
import '../modules/sport_screen.dart';
import 'news_cubit.dart';
import 'news_states.dart';



class NewsLayout extends StatelessWidget {
  List <Widget> screen =[const BusinessScreen(),const ScienceScreen(),const SportScreen()];

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NewsCubit,NewsStates>(
        builder: (context,state){
          var cubit =NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News'),
              actions: [
              IconButton(
                  onPressed: () {
                    cubit.changeMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined)),
              ],),
            body: screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon:  Icon(Icons.monetization_on_rounded),label: 'Business'),
                BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
                BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sport'),
              ],
              currentIndex : cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNavBar(index);
                print ("index is $index");
              },
            ),

          );
        },
    );

  }
}
