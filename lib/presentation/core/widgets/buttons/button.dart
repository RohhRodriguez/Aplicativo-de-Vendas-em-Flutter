import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_desafio_flutter/presentation/core/utils/extensions.dart';
import 'package:projeto_desafio_flutter/presentation/core/widgets/reports/comission_report/comission_report.dart';
import '../../../../application/cubit/reports/comission_report/comission_report_cubit/comission_report_cubit.dart';
import '../../../../application/cubit/reports/sales_report/sales_report_cubit.dart';
import '../../../../application/services/report_generic_service.dart';
import '../reports/sales_report/sales_report.dart';

class ButtonReport extends StatelessWidget {
  final ReportGenerate reportGenerate;
  final ComissionReportCubit comissionReportCubit = ComissionReportCubit();
  final SalesReportCubit salesReportCubit = SalesReportCubit();
  final formatter = NumberFormat("#,##0.00", "pt_BR");
  final double? total;

  ButtonReport({
    Key? key,
    required this.reportGenerate,
    this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => routePageReport(context)));
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            color: Colors.grey.shade200,
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.circle, size: 30),
                  Icon(
                    reportGenerate.icon,
                    size: 20,
                    color: Colors.blue,
                  )
                ],
              ),
              const SizedBox(width: 10),
              Text(
                reportGenerate.titleReport,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(flex: 1),
              total != null
                  ? reportGenerate.titleReport != 'Relatório de Entregas'
                      ? Text(
                          'R\$ ${total!.currencyFormat(total!)}',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          '${total!.toInt()} pedidos',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        )
                  : const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }

  Widget routePageReport(BuildContext context) {
    switch (reportGenerate.reportType) {
      case EReport.salesReport:
        return SalesReport();
      case EReport.commissionReport:
        return CommissionReport();
      case EReport.stockReport:
      // return StockReport();
      case EReport.deliveryReport:
        return CommissionReport();
    }
  }
}
