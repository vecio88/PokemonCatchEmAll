import 'package:flutter/material.dart';
import 'package:pokedex/repository/pokedex_db.dart';
import '../model/Pokemon.dart';

class PokedexRegionale extends StatefulWidget {
  @override
  _PokedexRegionaleState createState() => _PokedexRegionaleState();
}

class _PokedexRegionaleState extends State<PokedexRegionale> {
  PokedexDb db;
  bool isSwitched = false;

  @override
  void initState() {
    // getListaPokemon();
    db = PokedexDb();
    db.initDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Pokemon> listaPokemon;

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Pokedex Isola Armatura ' + ((isSwitched) ? 'VERO' : 'FALSO')),
        actions: [
          Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              })
        ],
      ),
      body: FutureBuilder(
        future: getListaPokemon(isSwitched),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapShot) {
          listaPokemon = snapShot.data;
          return ListView.builder(
              itemCount: (listaPokemon == null) ? 0 : listaPokemon.length,
              itemBuilder: (_, index) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                    tileColor: (listaPokemon[index].checkCatturato)
                        ? Colors.green[100]
                        : Colors.red[100],
                    onTap: () {
                      var nuovoStatoPokemon = listaPokemon[index];
                      nuovoStatoPokemon.checkCatturato =
                          (nuovoStatoPokemon.checkCatturato) ? false : true;
                      db.aggiornaPokemon(nuovoStatoPokemon);
                      setState(() {});
                    },
                    leading: Image.network(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/' +
                            listaPokemon[index].idNazionale.toString() +
                            '.png'),
                    title: Text(listaPokemon[index].nome ?? ''),
                    subtitle: Text('Tipo 1: ' +
                        (listaPokemon[index].tipo1 ?? '') +
                        ' - Tipo 2: ' +
                        (listaPokemon[index].tipo2 ?? '') +
                        ' - Catturato: ' +
                        ((listaPokemon[index].checkCatturato) ? 'SI' : 'NO')),
                  ),
                );
              });
        },
      ),
    );
  }

  Future getListaPokemon(isSwitched) async {
    List<Pokemon> listaPokemon = await db.leggiListaPokemon(isSwitched);
    print('Nel pokedex ci sono ' + listaPokemon.length.toString() + ' Pokemon');
    return listaPokemon;
  }

  Future provaDb() async {
    PokedexDb pokedexDb = PokedexDb();
    await pokedexDb.initDatabase();
  }
}
