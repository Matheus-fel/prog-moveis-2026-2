// CICLO 3 — LISTAS
// ListView e ListView.builder — a lista de talhões do Caderno de Campo
// Programação para Dispositivos Móveis · IF Goiano — Campus Ceres
//
// A IDEIA
// Você já tem a classe Talhao dos exercícios de Dart. Agora vamos
// transformar uma LISTA de talhões em uma LISTA NA TELA, rolável.
//
// ListView          -> quando há poucos itens fixos, escritos à mão.
// ListView.builder  -> quando os itens vêm de uma coleção. Constrói cada
//                      item sob demanda (só o que está visível). É o que
//                      se usa de verdade.

import 'package:flutter/material.dart';

// A mesma classe Talhao dos exercícios de Dart.
class Talhao {
  final String nome;
  final double areaHa;
  final String cultura;
  const Talhao({required this.nome, required this.areaHa, required this.cultura});
}

// Os dados da propriedade — TAREFA 1: Dois talhões adicionados à lista
const List<Talhao> talhoes = [
  Talhao(nome: 'Talhão 1', areaHa: 38.0, cultura: 'soja'),
  Talhao(nome: 'Talhão 2', areaHa: 24.5, cultura: 'milho'),
  Talhao(nome: 'Talhão 3', areaHa: 42.0, cultura: 'milho'),
  Talhao(nome: 'Talhão 4', areaHa: 31.2, cultura: 'soja'),
  Talhao(nome: 'Talhão 5', areaHa: 12.8, cultura: 'sorgo'),
  Talhao(nome: 'Talhão 6', areaHa: 19.4, cultura: 'milho'),
  Talhao(nome: 'Talhão 7', areaHa: 50.0, cultura: 'feijão'),
  Talhao(nome: 'Talhão 8', areaHa: 15.5, cultura: 'soja'),
];

void main() => runApp(const CadernoApp());

class CadernoApp extends StatelessWidget {
  const CadernoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caderno de Campo do Vale',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E5631)),
        useMaterial3: true,
      ),
      home: const TelaTalhoes(),
    );
  }
}

class TelaTalhoes extends StatelessWidget {
  const TelaTalhoes({super.key});

  // TAREFA 3 — Seleção de ícone conforme a cultura
  IconData _obterIconeCultura(String cultura) {
    switch (cultura.toLowerCase()) {
      case 'milho':
        return Icons.grain;
      case 'soja':
        return Icons.eco;
      default:
        return Icons.grass;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talhões'),
        backgroundColor: const Color(0xFF1E5631),
        foregroundColor: Colors.white,
      ),
      // ListView.builder percorre a lista e cria um item para cada talhão.
      body: ListView.builder(
        itemCount: talhoes.length,
        itemBuilder: (context, indice) {
          final talhao = talhoes[indice];

          // TAREFA 2 — Formatação da área no padrão PT-BR (vírgula)
          final areaFormatada = talhao.areaHa
              .toStringAsFixed(1)
              .replaceAll('.', ',');

          // TAREFA 4 — ListTile envolvido em Card para dar destaque visual
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: ListTile(
              leading: Icon(
                _obterIconeCultura(talhao.cultura),
                color: const Color(0xFF1E5631),
              ),
              title: Text(
                talhao.nome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('$areaFormatada ha — ${talhao.cultura}'),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}