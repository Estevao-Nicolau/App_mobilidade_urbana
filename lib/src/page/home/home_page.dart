import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   String resultBus = 'bus';

  TextEditingController controllerBus = TextEditingController();
  
  final token = '7ce4e7970868de4bcfb1fe664664b9def6613a4eb8abdc4e840ff193249fafe4';

  // Método Buscar Ônibus
  void searchingBus()async{
    String receiveBus = controllerBus.text;
    var url = Uri.parse('http://api.olhovivo.sptrans.com.br/v2.1/Linha/Buscar?termosBusca=$resultBus');
    http.Response response;
    response = await http.get(url);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo de pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: controllerBus,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Pesquisa seu Ônibus',
                  prefixIcon: const Icon(Icons.search,
                      color: Colors.blueGrey, size: 24),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            // Mapa
            const Expanded(
              child: Placeholder(
                child: Center(child: Text('Mapa')),
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.bus_alert),
                    title: Text('Nome Ônibus'),
                    subtitle: Text('Conteúdo'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
