part of 'home_screen_bloc.dart';


@immutable
abstract class HomeScreenEvent {}

class HomeScreenInitialEvent extends HomeScreenEvent {}

class FetchAllHomeScreenAPIsEvent extends HomeScreenEvent {}


class PostAddIncomeEvent extends HomeScreenEvent {
  final String IncomeDate;
  final String Amount;
  final String Description;

  PostAddIncomeEvent(this.IncomeDate,this.Amount, this.Description);
}