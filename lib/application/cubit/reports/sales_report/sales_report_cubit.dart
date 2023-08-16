import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_desafio_flutter/application/services/report_generic_service.dart';
import 'package:projeto_desafio_flutter/domain/models/reports/sales_report/sales_report.dart';
import '../../../controller/controller.dart';
part 'sales_report_state.dart';

class SalesReportCubit extends Cubit<SalesReportState> {
  final Controller controller = Controller();
  SalesReportCubit() : super(SalesReportInitial()) {
    emit(WaintingTotalSales());
    calculateTotalSales();
  }

  calculateTotalSales() async {
    await Future.delayed(Duration(seconds: 3));
    emit(CalculatedTotalSales(
      totalSales: controller.salesReport.total,
      salesReport: controller.salesReport,
    ));
  }

  generateSalesReport() async {
    emit(LoadingSalesReportData());
    await Future.delayed(const Duration(seconds: 2));
  }
}
