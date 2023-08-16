part of 'total_report_cubit.dart';

@immutable
abstract class TotalReportState {}

class TotalReportInitial extends TotalReportState {}

class SuccessTotalizationReportState2 extends TotalReportState {
  final ReportGenerate salesReport;
  final ReportGenerate commissionReport;
  final ReportGenerate stockReport;
  final ReportGenerate deliveryReport;
  SuccessTotalizationReportState2({
    required this.salesReport,
    required this.commissionReport,
    required this.stockReport,
    required this.deliveryReport,
  });
}
