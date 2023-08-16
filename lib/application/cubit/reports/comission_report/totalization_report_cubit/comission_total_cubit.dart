import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../infrastructure/repository/reports/comission_repository/comission_report_repository.dart';
import '../../../../controller/controller.dart';

part 'comission_total_state.dart';

class TotalComissionCubit extends Cubit<TotalComissionState> {
  ComissionReportRepository comissionReportRepository = ComissionReportRepository();
  final Controller controller = Controller();
  TotalComissionCubit() : super(ComissionReportInitial()) {
    emit(WaintingTotalComission());
    calculateTotalComission();
  }

  calculateTotalComission() async {
    await Future.delayed(const Duration(seconds: 2));
    double totalComission = await comissionReportRepository.getTotalComissionReport();

    emit(CalculatedTotalComission(
      totalComission: totalComission,
    ));
  }
}
