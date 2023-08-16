import '../../atendente.dart';
import '../../comission_detail_report.dart';
import 'comission_report.dart';

abstract class IComissionReportRepository {
  List<ComissionReport> getAllReports();
  double getTotalComissionReport();
}

abstract class IComissionDetailReportRepository {
  List<ComissionReportDetail> getAllProducts(Atendente atendente);
  double getTotalSoldReport();
  double getTotalComissionReport();
}
