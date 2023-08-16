import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../domain/models/atendente.dart';
import '../../../controller/controller.dart';
part 'delivery_report_state.dart';

class DeliveryReportCubit extends Cubit<DeliveryReportState> {
  final Controller controller = Controller();
  DeliveryReportCubit() : super(DeliveryReportInitial()) {
    emit(WaintingTotalDelivery());
    calculateTotalDelivery();
  }

  calculateTotalDelivery() async {
    await Future.delayed(const Duration(seconds: 5));
    emit(CalculatedTotalDelivery(
      totalDelivery: controller.deliveryReport.total,
    ));
    await Future.delayed(const Duration(seconds: 10));
  }

  generateDeliveryReport() async {
    emit(LoadingDeliveryReportData());
    await Future.delayed(const Duration(seconds: 2));
    emit(SuccessDeliveryReportData(atendentList: [], detaildeliveryList: [], totalValueItem: [], totaldelivery: 0));
  }
}
