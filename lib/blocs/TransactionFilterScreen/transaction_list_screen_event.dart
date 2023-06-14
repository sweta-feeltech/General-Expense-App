part of "transaction_list_screen_bloc.dart";

@immutable
abstract class TrnsacctionListScreenEvent {}

class TrnsacctionListScreenStateScreenInitialEvent extends TrnsacctionListScreenEvent {}


class FetchTransactionDataOnFilterEvent extends TrnsacctionListScreenEvent {
  final String startDate;
  final String endDate;
  final String? filterStatus;

  FetchTransactionDataOnFilterEvent({required this.startDate,required this.endDate, this.filterStatus});
}

