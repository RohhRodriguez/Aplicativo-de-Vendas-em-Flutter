import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../controller/controller.dart';
import '../../services/report_generic_service.dart';
part 'total_report_state.dart';

class TotalReportCubit extends Cubit<TotalReportState> {
  final Controller controller = Controller();
  TotalReportCubit() : super(TotalReportInitial()) {
    calculateTotalValueReport();
  }

  calculateTotalValueReport() async {
    await Future.delayed(const Duration(seconds: 5));
    emit(SuccessTotalizationReportState2(
        commissionReport: controller.commissionReport,
        deliveryReport: controller.deliveryReport,
        salesReport: controller.salesReport,
        stockReport: controller.stockReport));
  }
}
