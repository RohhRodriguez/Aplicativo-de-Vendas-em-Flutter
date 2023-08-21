import 'package:flutter/material.dart';
import 'package:projeto_desafio_flutter/presentation/pages/crud/atendentes/adicionar_atendente.dart';
import 'package:projeto_desafio_flutter/presentation/pages/crud/clientes/adicionar_cliente.dart';
import '../../../../application/services/report_generic_service.dart';

enum EItem { register, reports, newOrder, deliveryTicket }

class PrincipalMenu extends StatefulWidget {
  final ReportGenerate reportGenerate;
  const PrincipalMenu({
    Key? key,
    required this.reportGenerate,
  }) : super(key: key);

  @override
  State<PrincipalMenu> createState() => _PrincipalMenuState();
}

class _PrincipalMenuState extends State<PrincipalMenu> {
  EItem? selectedMenu;

  onItemSelected(String value) {
    var t;
    switch (value) {
      case 'Cadastrar Produto':
        // t = AdicionarProduto();
        break;
      case 'Cadastrar Cliente':
        t = AdicionarCliente();
        break;
      case 'Cadastrar Atendente':
        t = AdicionarAtendente();
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (BuildContext context) => t),
    );
  }

// onSelected
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(Icons.more_vert, color: Colors.black),
        onSelected: onItemSelected,
        itemBuilder: (_) {
          return [
            PopupMenuItem(
                value: "Cadastrar Cliente",
                child: Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      color: Colors.blue,
                      size: 10,
                    ),
                    SizedBox(width: 10),
                    Text("Cadastrar Cliente"),
                  ],
                )),
            PopupMenuItem(
                value: "Cadastrar Produto",
                child: Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      color: Colors.blue,
                      size: 10,
                    ),
                    SizedBox(width: 10),
                    Text("Cadastrar Produto"),
                  ],
                )),
            PopupMenuItem(
                value: 'Cadastrar Atendente',
                child: Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      color: Colors.blue,
                      size: 10,
                    ),
                    SizedBox(width: 10),
                    Text("Cadastrar Atendente"),
                  ],
                )),
            PopupMenuItem(
              value: "Novo Pedido",
              child: Row(
                children: const [
                  Icon(
                    Icons.circle,
                    color: Colors.blue,
                    size: 10,
                  ),
                  SizedBox(width: 10),
                  Text("Novo Pedido"),
                ],
              ),
            ),
            PopupMenuItem(
              value: "Ticket de Entrega",
              child: Row(
                children: const [
                  Icon(
                    Icons.circle,
                    color: Colors.blue,
                    size: 10,
                  ),
                  SizedBox(width: 10),
                  Text("Ticket de Entrega"),
                ],
              ),
            )
          ];
        });
  }
}
