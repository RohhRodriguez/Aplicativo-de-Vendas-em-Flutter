import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_desafio_flutter/domain/models/atendente.dart';
import '../../../../../domain/models/pedido.dart';
import '../../../../../infrastructure/repository/reports/comission_repository/comission_report_repository.dart';
part 'comission_report_detail_state.dart';

class ComissionReportDetailCubit extends Cubit<ComissionReportDetailState> {
  ComissionReportRepository comissionReportRepository = ComissionReportRepository();
  ComissionReportDetailCubit() : super(ComissionReportDetailInitial());

  generateDetailComissionReport(Atendente atendente) async {
    emit(LoadingDetailComissionReportData());
    await Future.delayed(const Duration(seconds: 2));
    List<Pedido> listaPedidos = await comissionReportRepository.getDetailOrderReportComission(atendente);
    double totalComission = await comissionReportRepository.getTotalComissionReport();

    emit(SuccessDetailComissionReportData(listaPedidos: listaPedidos, totalComission: totalComission));
  }
}
