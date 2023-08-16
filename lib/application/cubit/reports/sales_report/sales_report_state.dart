part of 'sales_report_cubit.dart';

@immutable
abstract class SalesReportState {}

class SalesReportInitial extends SalesReportState {}

class WaintingTotalSales extends SalesReportState {}

class CalculatedTotalSales extends SalesReportState {
  final double totalSales;
  final ReportGenerate salesReport;
  CalculatedTotalSales({
    required this.totalSales,
    required this.salesReport,
  });
}

class LoadingSalesReportData extends SalesReportState {}

class SuccessSalesReportData extends SalesReportState {
  double totalSales;
  List<SalesReport> listSalesReport;
  SuccessSalesReportData({
    required this.totalSales,
    required this.listSalesReport,
  });
}

class ErrorSalesReportData extends SalesReportState {}
