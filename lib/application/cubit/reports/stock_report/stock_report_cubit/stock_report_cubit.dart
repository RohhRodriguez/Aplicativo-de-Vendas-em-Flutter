import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../domain/models/reports/stock_report/stock_report.dart';
import '../../../../controller/controller.dart';
part 'stock_report_state.dart';

class StockReportCubit extends Cubit<StockReportState> {
  final Controller controller = Controller();
  StockReportCubit() : super(StockReportInitial()) {
    emit(WaintingTotalStock());
    calculateTotalStock();
  }

  calculateTotalStock() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(CalculatedTotalStock(totalStock: controller.stockReport.total));
    await Future.delayed(const Duration(seconds: 10));
  }

  generateStockReport() async {
    emit(LoadingStockReportData());
    await Future.delayed(const Duration(seconds: 2));

    // List<StockReport> listStockReport = await stockReportRepository.getAllReports();
    // double totalReport = await stockReportRepository.getTotalComissionReport();

    // emit(SuccessStockReportData(listStockReport: [], totalStock: null));
  }
}
