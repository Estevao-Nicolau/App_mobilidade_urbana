import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      )),
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
