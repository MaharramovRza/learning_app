import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_page_events.dart';
import '../bloc/home_page_states.dart';

class HomePageBlocs extends Bloc<HomePageEvents,HomePageStates>{
  HomePageBlocs():super(HomePageStates()){
    on<HomePageDots>(_homePageDots);
  }

  void _homePageDots(HomePageDots event,Emitter<HomePageStates> emit){
    emit(state.copyWith(index:event.index));
  }

}

