import 'package:flutter/material.dart';

enum EPageInfo { reportPage, addClientPage, addProductPage, addAtendentPage }

class PageGenericInfo {
  final EPageInfo pageInfo;
  PageGenericInfo._(this.pageInfo);

  factory PageGenericInfo.reportPage() => PageGenericInfo._(EPageInfo.reportPage);
  factory PageGenericInfo.addClientPage() => PageGenericInfo._(EPageInfo.addClientPage);
  factory PageGenericInfo.addProductPage() => PageGenericInfo._(EPageInfo.addProductPage);
  factory PageGenericInfo.addAtendentPage() => PageGenericInfo._(EPageInfo.addAtendentPage);

  String get titlePage {
    return {
      EPageInfo.reportPage: 'Relatórios',
      EPageInfo.addClientPage: 'Cliente',
      EPageInfo.addProductPage: 'Produto',
      EPageInfo.addAtendentPage: 'Atendente',
    }[pageInfo]!;
  }

  IconData get iconPage {
    return {
      EPageInfo.reportPage: Icons.circle,
      EPageInfo.addClientPage: Icons.circle,
      EPageInfo.addProductPage: Icons.circle,
      EPageInfo.addAtendentPage: Icons.circle,
    }[pageInfo]!;
  }
}
