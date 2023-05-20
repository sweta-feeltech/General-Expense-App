part of 'income_list_screen_bloc.dart';

@immutable

abstract class IncomeListScreenEvent {}

class IncomeScreenListInitialEvent extends IncomeListScreenEvent {}

class FetchAllIncomeScreenListScreenAPIsEvent extends IncomeListScreenEvent {}