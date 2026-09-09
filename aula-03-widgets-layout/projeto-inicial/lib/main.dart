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

// A mesma classe Talhao que você já conhece dos exercícios de Dart.
class Talhao {
  final String nome;
  final double areaHa;
  final String cultura;
  const Talhao({required this.nome, required this.areaHa, required this.cultura});
}

// Os dados da propriedade — a mesma lista dos exercícios.
const List<Talhao> talhoes = [
  Talhao(nome: 'Talhão 1', areaHa: 38.0, cultura: 'soja'),
  Talhao(nome: 'Talhão 2', areaHa: 24.5, cultura: 'milho'),
  Talhao(nome: 'Talhão 3', areaHa: 42.0, cultura: 'milho'),
  Talhao(nome: 'Talhão 4', areaHa: 31.2, cultura: 'soja'),
  Talhao(nome: 'Talhão 5', areaHa: 12.8, cultura: 'sorgo'),
  Talhao(nome: 'Talhão 6', areaHa: 19.4, cultura: 'milho'),
  Talhao(nome: 'Talhão 7', areaHa: 19.4, cultura: 'soja'),
  Talhao(nome: 'Talhão 8', areaHa: 19.4, cultura: 'sorgo'),
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
      //
      // Comece apagando o Center abaixo e montando o Ciclo 1 no lugar.
      // ===================================================================
      body: Container(
        // Padding interno: afasta o conteúdo das bordas da caixa.
        padding: const EdgeInsets.all(16),
        // Column: empilha os filhos na vertical, de cima para baixo.
        child: Column(
          // Alinha os filhos à esquerda (início da horizontal).
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFFD5F5E3),
              child: Column(
                children: const[
                  Text(
                    'Fazenda Melo',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  // SizedBox: um espaço vazio de tamanho fixo. Aqui, respiro vertical.
                  SizedBox(height: 4),
                  Text(
                    'Goiânia - GO',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ), //Container

        SizedBox(height: 16),

        ////////////// CICLO 2
        Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ===================================================== BUG 1
            // Esta Row tenta colocar dois cards largos lado a lado, mas
            // eles somados passam da largura da tela -> overflow amarelo.
            // CONSERTE: envolva CADA card em um Expanded, para que dividam
            // o espaço disponível em vez de exigir a largura cheia.
            Row(
              children: [
                Expanded(
                  child: _CardNumero(titulo: 'Talhões cadastrados no total', valor: '6'),
                ),                
                SizedBox(width: 12),

                Expanded(
                  child: _CardNumero(titulo: 'Atividades registradas no mês', valor: '14'),
                ),
                
              ],
            ),

            const SizedBox(height: 16),

            // ===================================================== BUG 2
            // Este texto é muito longo e, dentro de uma Row, tenta ocupar
            // uma largura infinita -> overflow.
            // CONSERTE: envolva o Text em um Expanded para que ele quebre
            // a linha dentro do espaço que sobra.
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



            SizedBox(height: 16),
            // Row: distribui os filhos na horizontal, lado a lado.
            Row(
              children: [
                Text('Área total: ', style: TextStyle(fontSize: 16)),
                Text(
                  '96,4 ha',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Responsável: ', style: TextStyle(fontSize: 16)),
                Text(
                  'Paulo César Melo',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            // Ciclo 3
            Expanded(
              child: ListView.builder(
              itemCount: talhoes.length,
              itemBuilder: (context, indice) {
                final talhao = talhoes[indice];
                // ListTile: um item de lista pronto, com título, subtítulo e ícones.
                final IconData iconeCultura = switch (talhao.cultura.trim().toLowerCase()){
                  'milho' => Icons.grain,
                  'soja' => Icons.eco,
                  'sorgo' => Icons.spa,
                  _       => Icons.grass, 
                };
                
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  elevation: 2,
                  child: ListTile(
                    leading: Icon(iconeCultura, color: Color(0xFF1E5631)),
                    title: Text(talhao.nome),
                    subtitle: Text('${talhao.areaHa.toStringAsFixed(1).replaceAll('.', ',')} ha — ${talhao.cultura}'),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                );
                
                
                
              },
            ),
            ),
            




          ],
        ),
      ),

      // Botão flutuante de nova atividade — sem função ainda.
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1E5631),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Novo registro (em breve)')),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),


    );
  }
}

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
          Text(valor,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(titulo, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}