part of 'report_cubit.dart';

@immutable
abstract class ReportState {}

class LoadingState extends ReportState {}

class ReportTotalCalculated extends ReportState {}
