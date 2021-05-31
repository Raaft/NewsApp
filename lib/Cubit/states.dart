abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsBusinessSuccessLoadingState extends NewsStates {}

class NewsSGetBusinessSuccessState extends NewsStates {}

class NewsSGetBusinessErrorState extends NewsStates {
  final error;

  NewsSGetBusinessErrorState(this.error);
}

class NewsSportsSuccessLoadingState extends NewsStates {}

class NewsSGetSportsSuccessState extends NewsStates {}

class NewsSGetSportsErrorState extends NewsStates {
  final error;

  NewsSGetSportsErrorState(this.error);
}

class NewsScienceSuccessLoadingState extends NewsStates {}

class NewsSGetScienceSuccessState extends NewsStates {}

class NewsSGetScienceErrorState extends NewsStates {
  final error;

  NewsSGetScienceErrorState(this.error);
}
class NewsChangeThemeState extends NewsStates {}


class NewsSearchSuccessLoadingState extends NewsStates {}

class NewsSearchSuccessState extends NewsStates {}

class NewsSearchErrorState extends NewsStates {
  final error;
  NewsSearchErrorState(this.error);
}
