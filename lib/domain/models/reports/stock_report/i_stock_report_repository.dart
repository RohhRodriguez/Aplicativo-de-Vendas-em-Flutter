import 'package:projeto_desafio_flutter/domain/models/estoque.dart';
import 'package:projeto_desafio_flutter/domain/models/reports/stock_report/stock_report.dart';

abstract class IStockReportRepository {
  List<StockReport> getAllReports();
  double getTotalStockReport();
}

abstract class IStockDetailReportRepository {
  // List<StockReportDetail> getAllProducts(Atendente atendente);
  double getTotalSoldReport();
  double getTotalStockReport();
}
