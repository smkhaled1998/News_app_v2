
abstract class NewsStates{}

class NewsInitialState extends NewsStates{}
class NewsChangeBottomBarState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{}

class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{}

class NewsGetSportLoadingState extends NewsStates{}
class NewsGetSportSuccessState extends NewsStates{}
class NewsGetSportErrorState extends NewsStates{}


class NewsChangeAppMode extends NewsStates{}

