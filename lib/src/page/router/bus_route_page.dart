import 'dart:convert';

import 'package:flutter/material.dart';
import '../home/components/category_bus.dart';
import 'package:http/http.dart' as http;

class Bus_Route_Page extends StatefulWidget {
  const Bus_Route_Page({Key? key}) : super(key: key);

  @override
  State<Bus_Route_Page> createState() => _Bus_Route_PageState();
}

class _Bus_Route_PageState extends State<Bus_Route_Page> {
  Future<List> searchSenseLine() async {
    var url = Uri.parse(  // /Login/Autenticar?token=7ce4e7970868de4bcfb1fe664664b9def6613a4eb8abdc4e840ff193249fafe4'
        'http://api.olhovivo.sptrans.com.br/v2.1/Linha/Buscar?termosBusca=8000');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Erro ao carregar API');
    }
  }

  List<String> categories = [
    'Posição do veiculo ',
    'Linhas',
    'Paradas',
    'Previsão de chegada',
    'Bilhete Único',
  ];
  final List<String> busNames = [
    'Bus01',
    'Bus02',
    'Bus03',
    'Bus05',
    'Bus08',
    'Bus13',
    'Bus21',
    'Bus34',
    'Bus55'
  ];
  String selectedCategory = 'Paradas';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: searchSenseLine(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar Usuários'),
              );
            }

            if (snapshot.hasData) {
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Rotas dos Ônibus - Falta Consumir com a API - Montar o Card
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      height: MediaQuery.of(context).size.height * 0.20,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Card(
                                color: Colors.blue,
                                child: Center(
                                  child: Text(
                                    snapshot.data?[index]['tp'],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 36.0),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    // Categorias -  Falta Consumir com a API - GOOgle-Maps
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return CategoryTiles(
                            onPressed: () {
                              setState(() {
                                selectedCategory = categories[index];
                              });
                            },
                            category: categories[index],
                            isSelected: categories[index] == selectedCategory,
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(width: 10),
                        itemCount: categories.length,
                      ),
                    ),
                    // Mapa
                    const Expanded(
                      child: Placeholder(
                        child: Center(child: Text('Mapa')),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}