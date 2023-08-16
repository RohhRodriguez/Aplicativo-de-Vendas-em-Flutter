import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../infrastructure/repository/reports/stock_repository/stock_report_repository.dart';

part 'stock_report_total_state.dart';

class StockReportTotalCubit extends Cubit<StockReportTotalState> {
  StockReportRepository stockReportRepository = StockReportRepository();
  StockReportTotalCubit() : super(StockReportTotalInitial()) {
    emit(WaintingTotalStock());
    calculateTotalStock();
  }

  calculateTotalStock() async {
    await Future.delayed(const Duration(seconds: 2));
    double totalStock = await stockReportRepository.getTotalStockReport();

    emit(CalculatedTotalStock(
      totalStock: totalStock,
    ));
  }
}
