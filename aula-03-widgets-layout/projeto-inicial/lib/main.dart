// Caderno de Campo do Vale — PROJETO INICIAL
// Programação para Dispositivos Móveis · IF Goiano — Campus Ceres
//
// Este é o ponto de partida da aula de widgets de layout. O app já roda,
// mas a tela está praticamente vazia de propósito: você vai construí-la
// ao longo dos quatro ciclos, com o hot reload mostrando cada mudança.
//
// COMO RODAR (uma vez, no terminal, dentro desta pasta):
//   flutter create .        # gera as pastas nativas (android/, ios/...)
//   flutter pub get         # baixa as dependências
//   flutter run             # roda no dispositivo/emulador selecionado
//
// Depois, deixe o app rodando: salvar o arquivo aplica o hot reload.

import 'package:flutter/material.dart';

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
      home: const TelaResumo(),
    );
  }
}

class TelaResumo extends StatelessWidget {
  const TelaResumo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caderno de Campo do Vale'),
        backgroundColor: const Color(0xFF1E5631),
        foregroundColor: Colors.white,
      ),
      // ===================================================================
      // AQUI COMEÇA A AULA.
      //
      // Ao longo dos quatro ciclos, você vai substituir este corpo pela
      // tela de resumo da propriedade:
      //
      //   Ciclo 1 — o cabeçalho (nome da propriedade + área total)
      //   Ciclo 2 — a faixa com três números, sem overflow (Expanded)
      //   Ciclo 3 — a lista de talhões (ListView.builder)
      //   Ciclo 4 — tudo junto, na ordem certa
      //
      // Os arquivos de cada ciclo estão na pasta ../exercicios do repositório
      // e também podem ser praticados no dartpad.dev (modo Flutter).
      // ===================================================================
      // Container: uma caixa que dá cor, margem, borda e tamanho ao filho.
      body: Container(
        // Padding interno: afasta o conteúdo das bordas da caixa.
        padding: const EdgeInsets.all(16),
        // Column: empilha os filhos na vertical, de cima para baixo.
        child: Column(
          // TAREFA 4 — Alinha os filhos à esquerda (início da horizontal)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------------------------------------------
            // CICLO 1 — O ALFABETO DO LAYOUT
            // -------------------------------------------------------------
            // TAREFA 3 — Container verde claro abraçando nome e cidade
            Container(
              padding: const EdgeInsets.all(12),
              color: const Color(0xFFD5F5E3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // TAREFA 1 — Nome da propriedade
                  Text(
                    'Estância Boa Esperança',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  // SizedBox: um espaço vazio de tamanho fixo. Aqui, respiro vertical.
                  SizedBox(height: 4),
                  // TAREFA 1 — Cidade da propriedade
                  Text(
                    'Rialma — GO',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Row: distribui os filhos na horizontal, lado a lado.
            const Row(
              children: [
                Text('Área total: ', style: TextStyle(fontSize: 16)),
                Text(
                  '96,4 ha',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // TAREFA 2 — Acrescente, abaixo da área total, mais uma Row informando o responsável
            const Row(
              children: [
                Text('Responsável: ', style: TextStyle(fontSize: 16)),
                Text(
                  'Matheus Pereira',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // -------------------------------------------------------------
            // CICLO 2 — RESTRIÇÕES E O OVERFLOW AMARELO
            // -------------------------------------------------------------
            // TAREFA 1 (BUG 1) — Cards envolvidos em Expanded para dividir o espaço
            Row(
              children: const [
                Expanded(
                  child: _CardNumero(
                    titulo: 'Talhões cadastrados no total',
                    valor: '6',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _CardNumero(
                    titulo: 'Atividades registradas no mês',
                    valor: '14',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // TAREFA 2 (BUG 2) — Texto longo envolvido em Expanded para quebrar a linha
            Row(
              children: const [
                Icon(Icons.info_outline, color: Color(0xFF1E5631)),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Última sincronização feita há três dias — verifique o sinal '
                    'antes de sair para a lavoura para não perder registros.',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget auxiliar do Ciclo 2 para renderizar os cards de número
class _CardNumero extends StatelessWidget {
  final String titulo;
  final String valor;
  const _CardNumero({required this.titulo, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD5F5E3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            valor,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(titulo, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}