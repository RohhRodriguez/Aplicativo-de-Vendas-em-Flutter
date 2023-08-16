import 'package:projeto_desafio_flutter/domain/models/reports/delivery_report/delivery_report.dart';

abstract class IDeliveryReportRepository {
  List<DeliveryReport> getAllReports();
  double getTotalSoldReport();
}
