import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../domain/models/reports/comission_report/comission_report.dart';
import '../../../../../infrastructure/repository/reports/comission_repository/comission_report_repository.dart';
part 'comission_report_state.dart';

class ComissionReportCubit extends Cubit<ComissionReportState> {
  ComissionReportRepository comissionReportRepository = ComissionReportRepository();
  ComissionReportCubit() : super(ComissionReportInitial());

  generateComissionReport() async {
    emit(LoadingComissionReportData());
    await Future.delayed(const Duration(seconds: 2));

    List<ComissionReport> listComissionReport = await comissionReportRepository.getAllReports();
    double totalReport = await comissionReportRepository.getTotalComissionReport();
    emit(SuccessComissionReportData(
      listComissionReport: listComissionReport,
      totalComission: totalReport,
    ));
  }
}
