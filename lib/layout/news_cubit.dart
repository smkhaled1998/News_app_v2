import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/network/cashe_helper.dart';
import '../shared/network/dio-helper.dart';
import 'news_states.dart';


class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsInitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex =0;
  void changeBottomNavBar (int index){
    currentIndex=index;
    print("current index is $currentIndex");
    emit(NewsChangeBottomBarState());
  }

   List <dynamic> business=[];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        bath: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apikey':'81d40cce422e4cb5b487aabd87c7ba41',
        }).then((value){
          business=value.data['articles'];
          emit(NewsGetBusinessSuccessState());

    }).catchError((error){
      print('Error is ${error.toString()}');
      emit(NewsGetBusinessErrorState());
    });

  }

  List <dynamic> sport=[];
  void getSport(){
    emit(NewsGetSportLoadingState());
    DioHelper.getData(
        bath: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sport',
          'apikey':'81d40cce422e4cb5b487aabd87c7ba41',
        }).then((value){
      sport=value.data['articles'];
      emit(NewsGetSportSuccessState());
    }).catchError((error){
      print('Error is ${error.toString()}');
      emit(NewsGetSportErrorState());
    });

  }

  List <dynamic> science=[];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
        bath: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apikey':'81d40cce422e4cb5b487aabd87c7ba41',
        }).then((value){
      science=value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print('Error is ${error.toString()}');
      emit(NewsGetScienceErrorState());
    });

  }

  bool isDark=false;

  void changeMode({bool? fromShared
}){
    if (fromShared != null){
      isDark=fromShared;
    }
    else {isDark =! isDark;

    CacheHelper.putMode(key: 'isDark', value: isDark).then((value) {emit(NewsChangeAppMode());});}
  }

  }




//https://newsapi.org/v2/top-headlines?country=eg&category=business&apikey=81d40cce422e4cb5b487aabd87c7ba41