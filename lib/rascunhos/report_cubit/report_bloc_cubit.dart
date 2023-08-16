import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:projeto_desafio_flutter/application/services/report_generic_service.dart';
import '../../application/controller/controller.dart';
part 'report_bloc_state.dart';

class ReportBloc extends Cubit<ReportBlocState> {
  final controller = Controller();

  ReportBloc() : super(InitialState()) {
    calculateTotalValueReport();
  }

  calculateTotalValueReport() async {
    emit(WaitingReportState(
        companyName: controller.cadastroService.name,
        cnpj: controller.cadastroService.documentNumber,
        titlePage: controller.pageGenericInfo.titlePage,
        commissionReport: controller.commissionReport,
        deliveryReport: controller.deliveryReport,
        salesReport: controller.salesReport,
        stockReport: controller.stockReport));
    await Future.delayed(const Duration(seconds: 10));
  }
}
