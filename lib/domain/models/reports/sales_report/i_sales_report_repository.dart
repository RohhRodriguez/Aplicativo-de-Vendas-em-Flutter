import 'package:projeto_desafio_flutter/domain/models/reports/sales_report/sales_report.dart';

abstract class ISalesReportRepository {
  List<SalesReport> getAllReports();
  double getTotalSoldReport();
}
