part of 'comission_report_cubit.dart';

@immutable
abstract class ComissionReportState {}

class ComissionReportInitial extends ComissionReportState {}

class LoadingComissionReportData extends ComissionReportState {}

class SuccessComissionReportData extends ComissionReportState {
  final double totalComission;
  final List<ComissionReport> listComissionReport;
  SuccessComissionReportData({
    required this.totalComission,
    required this.listComissionReport,
  });
}

class ErrorComissionReportData extends ComissionReportState {}
