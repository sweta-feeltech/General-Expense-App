part of "transaction_list_screen_bloc.dart";


@immutable
abstract class TrnsacctionListScreenState {}

class TrnsacctionListScreenStateScreenInitialState extends TrnsacctionListScreenState {}


class TrnsacctionListScreenStateScreenLoadingEventState extends TrnsacctionListScreenState {
  final bool showProgress;

  TrnsacctionListScreenStateScreenLoadingEventState(this.showProgress);
}


class FetchTransactionDataOnFilterEventState extends TrnsacctionListScreenState {
  final GetFilteredTransactionModel getFilteredTransactionModelData;

  FetchTransactionDataOnFilterEventState(this.getFilteredTransactionModelData);
}



class ApiFailureState extends TrnsacctionListScreenState {
  final Exception exception;

  ApiFailureState(this.exception);
}
