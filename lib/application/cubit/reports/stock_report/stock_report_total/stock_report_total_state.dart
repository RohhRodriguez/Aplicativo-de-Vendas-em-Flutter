part of 'stock_report_total_cubit.dart';

@immutable
abstract class StockReportTotalState {}

class StockReportTotalInitial extends StockReportTotalState {}

class WaintingTotalStock extends StockReportTotalState {}

class CalculatedTotalStock extends StockReportTotalState {
  double totalStock;
  CalculatedTotalStock({
    required this.totalStock,
  });
}
