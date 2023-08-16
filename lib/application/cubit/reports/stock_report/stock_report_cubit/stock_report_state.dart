// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'stock_report_cubit.dart';

@immutable
abstract class StockReportState {}

class StockReportInitial extends StockReportState {}

class WaintingTotalStock extends StockReportState {}

class CalculatedTotalStock extends StockReportState {
  final double totalStock;
  CalculatedTotalStock({
    required this.totalStock,
  });
}

class LoadingStockReportData extends StockReportState {}

class SuccessStockReportData extends StockReportState {
  List<StockReport> listStockReport;
  double totalStock;
  SuccessStockReportData({
    required this.listStockReport,
    required this.totalStock,
  });
}

class ErrorStockReportData extends StockReportState {}
