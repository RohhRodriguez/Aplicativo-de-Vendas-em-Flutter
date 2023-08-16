// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'report_bloc_cubit.dart';

@immutable
abstract class ReportBlocState {}

class InitialState extends ReportBlocState {}

class WaintingTotalReport extends ReportBlocState {}

class CalculatedTotalReport extends ReportBlocState {
  String companyName;
  String cnpj;
  String titlePage;
  ReportGenerate salesReport;
  ReportGenerate commissionReport;
  ReportGenerate stockReport;
  ReportGenerate deliveryReport;

  CalculatedTotalReport(
      {required this.companyName,
      required this.cnpj,
      required this.titlePage,
      required this.salesReport,
      required this.commissionReport,
      required this.stockReport,
      required this.deliveryReport});
}

class WaitingReportState extends ReportBlocState {
  String companyName;
  String cnpj;
  String titlePage;
  ReportGenerate salesReport;
  ReportGenerate commissionReport;
  ReportGenerate stockReport;
  ReportGenerate deliveryReport;

  WaitingReportState(
      {required this.companyName,
      required this.cnpj,
      required this.titlePage,
      required this.salesReport,
      required this.commissionReport,
      required this.stockReport,
      required this.deliveryReport});
}

class SuccessReportState extends ReportBlocState {
  double totalSales;
  double totalComission;
  double totalStocks;
  double totalDelivery;
  SuccessReportState({
    required this.totalSales,
    required this.totalComission,
    required this.totalStocks,
    required this.totalDelivery,
  });
}

class LoadingReportState extends ReportBlocState {
  String companyName;
  String cnpj;
  String titlePage;
  LoadingReportState({
    required this.companyName,
    required this.cnpj,
    required this.titlePage,
  });
}

// class SuccessReportState extends ReportBlocState {}

class ErrorReportState extends ReportBlocState {}
