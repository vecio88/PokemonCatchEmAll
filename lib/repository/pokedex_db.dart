import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import '../model/Pokemon.dart';

class PokedexDb {
  static final PokedexDb _singleton = PokedexDb._internal();
  PokedexDb._internal();

  DatabaseFactory dbFactory = databaseFactoryIo;
  Database _db;

  // con factory possiamo decidere cosa restituire,
  // se un nuovo oggetto o sempre lo stesso come in questo caso
  factory PokedexDb() {
    return _singleton;
  }

  final store = intMapStoreFactory.store('articoli');

  // Dobbiamo avere un solo DB
  Future<Database> init() async {
    if (_db == null) {
      await _openDB().then((db) {
        _db = db;
      });
    }

    return _db;
  }

  Future _openDB() async {
    final percorsoDocumenti = await getApplicationDocumentsDirectory();
    // Concatena il percorso documenti con il nome del DB inserendo
    // il separatore opportuno in base al OS
    final percorsoDB = join(percorsoDocumenti.path, 'pokedex.db');
    final db = await dbFactory.openDatabase(percorsoDB);

    return db;
  }

  Future initDatabase() async {
    if (_db == null) {
      print('Sto aprendo il DB');
      await init();
    }

    final finder = Finder(sortOrders: [
      SortOrder('idRegionale'),
    ]);

    final pokemonSnapshot = await store.find(_db, finder: finder);
    // await store.delete(_db);

    if (pokemonSnapshot.length == 0) {
      print('Il DB è Vuoto');

      await this.inserisciArticolo(
          Pokemon(79, 1, 'Slowpoke', 'Acqua', 'Psico', false));
      await this.inserisciArticolo(
          Pokemon(80, 2, 'Slowbro', 'Acqua', 'Psico', false));
      await this.inserisciArticolo(
          Pokemon(199, 3, 'Slowking', 'Acqua', 'Psico', false));
      await this.inserisciArticolo(
          Pokemon(427, 4, 'Buneary', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(428, 5, 'Lopunny', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(440, 6, 'Happiny', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(113, 7, 'Chansey', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(242, 8, 'Blissey', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(819, 9, 'Skwovet', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(820, 10, 'Greedent', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(174, 11, 'Igglybuff', 'Normale', 'Folletto', false));
      await this.inserisciArticolo(
          Pokemon(39, 12, 'Jigglypuff', 'Normale', 'Folletto', false));
      await this.inserisciArticolo(
          Pokemon(40, 13, 'Wigglytuff', 'Normale', 'Folletto', false));
      await this.inserisciArticolo(
          Pokemon(824, 14, 'Blipbug', 'Coleottero', null, false));
      await this.inserisciArticolo(
          Pokemon(825, 15, 'Dottler', 'Coleottero', 'Psico', false));
      await this.inserisciArticolo(
          Pokemon(826, 16, 'Orbeetle', 'Coleottero', 'Psico', false));
      await this
          .inserisciArticolo(Pokemon(753, 17, 'Fomantis', 'Erba', null, false));
      await this
          .inserisciArticolo(Pokemon(754, 18, 'Lurantis', 'Erba', null, false));
      await this.inserisciArticolo(
          Pokemon(840, 19, 'Applin', 'Erba', 'Drago', false));
      await this.inserisciArticolo(
          Pokemon(841, 20, 'Flapple', 'Erba', 'Drago', false));
      await this.inserisciArticolo(
          Pokemon(842, 21, 'Appletun', 'Erba', 'Drago', false));
      await this.inserisciArticolo(
          Pokemon(661, 22, 'Fletchling', 'Normale', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(662, 23, 'Fletchinder', 'Fuoco', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(663, 24, 'Talonflame', 'Fuoco', 'Volante', false));
      await this
          .inserisciArticolo(Pokemon(403, 25, 'Shinx', 'Elettro', null, false));
      await this
          .inserisciArticolo(Pokemon(404, 26, 'Luxio', 'Elettro', null, false));
      await this.inserisciArticolo(
          Pokemon(405, 27, 'Luxray', 'Elettro', null, false));
      await this.inserisciArticolo(
          Pokemon(707, 28, 'Klefki', 'Acciaio', 'Folletto', false));
      await this.inserisciArticolo(
          Pokemon(624, 29, 'Pawniard', 'Buio', 'Acciaio', false));
      await this.inserisciArticolo(
          Pokemon(625, 30, 'Bisharp', 'Buio', 'Acciaio', false));
      await this
          .inserisciArticolo(Pokemon(63, 31, 'Abra', 'Psico', null, false));
      await this
          .inserisciArticolo(Pokemon(64, 32, 'Kadabra', 'Psico', null, false));
      await this
          .inserisciArticolo(Pokemon(65, 33, 'Alakazam', 'Psico', null, false));
      await this.inserisciArticolo(
          Pokemon(280, 34, 'Ralts', 'Psico', 'Folletto', false));
      await this.inserisciArticolo(
          Pokemon(281, 35, 'Kirlia', 'Psico', 'Folletto', false));
      await this.inserisciArticolo(
          Pokemon(282, 36, 'Gardevoir', 'Psico', 'Folletto', false));
      await this.inserisciArticolo(
          Pokemon(475, 37, 'Gallade', 'Psico', 'Lotta', false));
      await this
          .inserisciArticolo(Pokemon(98, 38, 'Krabby', 'Acqua', null, false));
      await this
          .inserisciArticolo(Pokemon(99, 39, 'Kingler', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(72, 40, 'Tentacool', 'Acqua', 'Veleno', false));
      await this.inserisciArticolo(
          Pokemon(73, 41, 'Tentacruel', 'Acqua', 'Veleno', false));
      await this.inserisciArticolo(
          Pokemon(129, 42, 'Magikarp', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(130, 43, 'Gyarados', 'Acqua', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(223, 44, 'Remoraid', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(224, 45, 'Octillery', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(458, 46, 'Mantyke', 'Acqua', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(226, 47, 'Mantine', 'Acqua', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(278, 48, 'Wingull', 'Acqua', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(279, 49, 'Pelipper', 'Acqua', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(451, 50, 'Skorupi', 'Veleno', 'Coleottero', false));
      await this.inserisciArticolo(
          Pokemon(452, 51, 'Drapion', 'Veleno', 'Buio', false));
      await this.inserisciArticolo(
          Pokemon(206, 52, 'Dunsparce', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(626, 53, 'Bouffalant', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(108, 54, 'Lickitung', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(463, 55, 'Lickilicky', 'Normale', null, false));
      await this
          .inserisciArticolo(Pokemon(833, 56, 'Chewtle', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(834, 57, 'Drednaw', 'Acqua', 'Roccia', false));
      await this.inserisciArticolo(
          Pokemon(194, 58, 'Wooper', 'Acqua', 'Terra', false));
      await this.inserisciArticolo(
          Pokemon(195, 59, 'Quagsire', 'Acqua', 'Terra', false));
      await this
          .inserisciArticolo(Pokemon(704, 60, 'Goomy', 'Drago', null, false));
      await this
          .inserisciArticolo(Pokemon(705, 61, 'Sliggoo', 'Drago', null, false));
      await this
          .inserisciArticolo(Pokemon(706, 62, 'Goodra', 'Drago', null, false));
      await this.inserisciArticolo(
          Pokemon(621, 63, 'Druddigon', 'Drago', null, false));
      await this.inserisciArticolo(
          Pokemon(616, 64, 'Shelmet', 'Coleottero', null, false));
      await this.inserisciArticolo(
          Pokemon(617, 65, 'Accelgor', 'Coleottero', null, false));
      await this.inserisciArticolo(
          Pokemon(588, 66, 'Karrablast', 'Coleottero', null, false));
      await this.inserisciArticolo(
          Pokemon(589, 67, 'Escavalier', 'Coleottero', 'Acciaio', false));
      await this.inserisciArticolo(
          Pokemon(1, 68, 'Bulbasaur', 'Erba', 'Veleno', false));
      await this.inserisciArticolo(
          Pokemon(2, 69, 'Ivysaur', 'Erba', 'Veleno', false));
      await this.inserisciArticolo(
          Pokemon(3, 70, 'Venusaur', 'Erba', 'Veleno', false));
      await this
          .inserisciArticolo(Pokemon(7, 71, 'Squirtle', 'Acqua', null, false));
      await this
          .inserisciArticolo(Pokemon(8, 72, 'Wartortle', 'Acqua', null, false));
      await this
          .inserisciArticolo(Pokemon(9, 73, 'Blastoise', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(543, 74, 'Venipede', 'Coleottero', 'Veleno', false));
      await this.inserisciArticolo(
          Pokemon(544, 75, 'Whirlipede', 'Coleottero', 'Veleno', false));
      await this.inserisciArticolo(
          Pokemon(545, 76, 'Scolipede', 'Coleottero', 'Veleno', false));
      await this.inserisciArticolo(
          Pokemon(590, 77, 'Foongus', 'Erba', 'Veleno', false));
      await this.inserisciArticolo(
          Pokemon(591, 78, 'Amoonguss', 'Erba', 'Veleno', false));
      await this.inserisciArticolo(
          Pokemon(764, 79, 'Comfey', 'Folletto', null, false));
      await this
          .inserisciArticolo(Pokemon(114, 80, 'Tangela', 'Erba', null, false));
      await this.inserisciArticolo(
          Pokemon(465, 81, 'Tangrowth', 'Erba', null, false));
      await this.inserisciArticolo(
          Pokemon(453, 82, 'Croagunk', 'Veleno', 'Lotta', false));
      await this.inserisciArticolo(
          Pokemon(454, 83, 'Toxicroak', 'Veleno', 'Lotta', false));
      await this
          .inserisciArticolo(Pokemon(172, 84, 'Pichu', 'Elettro', null, false));
      await this.inserisciArticolo(
          Pokemon(25, 85, 'Pikachu', 'Elettro', null, false));
      await this
          .inserisciArticolo(Pokemon(26, 86, 'Raichu', 'Elettro', null, false));
      await this
          .inserisciArticolo(Pokemon(570, 87, 'Zorua', 'Buio', null, false));
      await this
          .inserisciArticolo(Pokemon(571, 88, 'Zoroark', 'Buio', null, false));
      await this.inserisciArticolo(
          Pokemon(765, 89, 'Oranguru', 'Normale', 'Psico', false));
      await this.inserisciArticolo(
          Pokemon(766, 90, 'Passimian', 'Lotta', null, false));
      await this.inserisciArticolo(
          Pokemon(341, 91, 'Corphish', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(342, 92, 'Crawdaunt', 'Acqua', 'Buio', false));
      await this.inserisciArticolo(
          Pokemon(845, 93, 'Cramorant', 'Volante', 'Acqua', false));
      await this
          .inserisciArticolo(Pokemon(118, 94, 'Goldeen', 'Acqua', null, false));
      await this
          .inserisciArticolo(Pokemon(119, 95, 'Seaking', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(846, 96, 'Arrokuda', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(847, 97, 'Barraskewda', 'Acqua', null, false));
      await this
          .inserisciArticolo(Pokemon(120, 98, 'Staryu', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(121, 99, 'Starmie', 'Acqua', 'Psico', false));
      await this
          .inserisciArticolo(Pokemon(891, 100, 'Kubfu', 'Lotta', null, false));
      await this.inserisciArticolo(
          Pokemon(892, 101, 'Urshifu', 'Lotta', 'Buio', false));
      await this.inserisciArticolo(
          Pokemon(587, 102, 'Emolga', 'Elettro', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(702, 103, 'Dedenne', 'Elettro', 'Folletto', false));
      await this.inserisciArticolo(
          Pokemon(877, 104, 'Morpeko', 'Elettro', 'Buio', false));
      await this.inserisciArticolo(
          Pokemon(81, 105, 'Magnemite', 'Elettro', 'Acciaio', false));
      await this.inserisciArticolo(
          Pokemon(82, 106, 'Magneton', 'Elettro', 'Acciaio', false));
      await this.inserisciArticolo(
          Pokemon(462, 107, 'Magnezone', 'Elettro', 'Acciaio', false));
      await this.inserisciArticolo(
          Pokemon(686, 108, 'Inkay', 'Buio', 'Psico', false));
      await this.inserisciArticolo(
          Pokemon(687, 109, 'Malamar', 'Buio', 'Psico', false));
      await this.inserisciArticolo(
          Pokemon(746, 110, 'Wishiwashi', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(318, 111, 'Carvanha', 'Acqua', 'Buio', false));
      await this.inserisciArticolo(
          Pokemon(319, 112, 'Sharpedo', 'Acqua', 'Buio', false));
      await this.inserisciArticolo(
          Pokemon(506, 113, 'Lillipup', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(507, 114, 'Herdier', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(508, 115, 'Stoutland', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(128, 116, 'Tauros', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(241, 117, 'Miltank', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(123, 118, 'Scyther', 'Coleottero', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(212, 119, 'Scizor', 'Coleottero', 'Acciaio', false));
      await this.inserisciArticolo(
          Pokemon(127, 120, 'Pinsir', 'Coleottero', null, false));
      await this.inserisciArticolo(
          Pokemon(214, 121, 'Heracross', 'Coleottero', 'Lotta', false));
      await this.inserisciArticolo(
          Pokemon(557, 122, 'Dwebble', 'Coleottero', 'Roccia', false));
      await this.inserisciArticolo(
          Pokemon(558, 123, 'Crustle', 'Coleottero', 'Roccia', false));
      await this.inserisciArticolo(
          Pokemon(767, 124, 'Wimpod', 'Coleottero', 'Acqua', false));
      await this.inserisciArticolo(
          Pokemon(768, 125, 'Golisopod', 'Coleottero', 'Acqua', false));
      await this.inserisciArticolo(
          Pokemon(871, 126, 'Pincurchin', 'Elettro', null, false));
      await this.inserisciArticolo(
          Pokemon(747, 127, 'Mareanie', 'Veleno', 'Acqua', false));
      await this.inserisciArticolo(
          Pokemon(748, 128, 'Toxapex', 'Veleno', 'Acqua', false));
      await this.inserisciArticolo(
          Pokemon(852, 129, 'Clobbopus', 'Lotta', null, false));
      await this.inserisciArticolo(
          Pokemon(853, 130, 'Grapploct', 'Lotta', null, false));
      await this.inserisciArticolo(
          Pokemon(90, 131, 'Shellder', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(91, 132, 'Cloyster', 'Acqua', 'Ghiaccio', false));
      await this.inserisciArticolo(
          Pokemon(769, 133, 'Sandygast', 'Spettro', 'Terra', false));
      await this.inserisciArticolo(
          Pokemon(770, 134, 'Palossand', 'Spettro', 'Terra', false));
      await this.inserisciArticolo(
          Pokemon(425, 135, 'Drifloon', 'Spettro', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(426, 136, 'Drifblim', 'Spettro', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(339, 137, 'Barboach', 'Acqua', 'Terra', false));
      await this.inserisciArticolo(
          Pokemon(340, 138, 'Whiscash', 'Acqua', 'Terra', false));
      await this.inserisciArticolo(
          Pokemon(298, 139, 'Azurill', 'Normale', 'Folletto', false));
      await this.inserisciArticolo(
          Pokemon(183, 140, 'Marill', 'Acqua', 'Folletto', false));
      await this.inserisciArticolo(
          Pokemon(184, 141, 'Azumarill', 'Acqua', 'Folletto', false));
      await this
          .inserisciArticolo(Pokemon(60, 142, 'Poliwag', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(61, 143, 'Poliwhirl', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(62, 144, 'Poliwrath', 'Acqua', 'Lotta', false));
      await this.inserisciArticolo(
          Pokemon(186, 145, 'Politoed', 'Acqua', null, false));
      await this
          .inserisciArticolo(Pokemon(54, 146, 'Psyduck', 'Acqua', null, false));
      await this
          .inserisciArticolo(Pokemon(55, 147, 'Golduck', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(293, 148, 'Whismur', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(294, 149, 'Loudred', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(295, 150, 'Exploud', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(527, 151, 'Woobat', 'Psico', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(528, 152, 'Swoobat', 'Psico', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(227, 153, 'Skarmory', 'Acciaio', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(524, 154, 'Roggenrola', 'Roccia', null, false));
      await this.inserisciArticolo(
          Pokemon(525, 155, 'Boldore', 'Roccia', null, false));
      await this.inserisciArticolo(
          Pokemon(526, 156, 'Gigalith', 'Roccia', null, false));
      await this.inserisciArticolo(
          Pokemon(744, 157, 'Rockruff', 'Roccia', null, false));
      await this.inserisciArticolo(
          Pokemon(745, 158, 'Lycanroc', 'Roccia', null, false));
      await this.inserisciArticolo(
          Pokemon(757, 159, 'Salandit', 'Veleno', 'Fuoco', false));
      await this.inserisciArticolo(
          Pokemon(758, 160, 'Salazzle', 'Veleno', 'Fuoco', false));
      await this.inserisciArticolo(
          Pokemon(559, 161, 'Scraggy', 'Buio', 'Lotta', false));
      await this.inserisciArticolo(
          Pokemon(560, 162, 'Scrafty', 'Buio', 'Lotta', false));
      await this.inserisciArticolo(
          Pokemon(619, 163, 'Mienfoo', 'Lotta', null, false));
      await this.inserisciArticolo(
          Pokemon(620, 164, 'Mienshao', 'Lotta', null, false));
      await this.inserisciArticolo(
          Pokemon(782, 165, 'Jangmo-o', 'Drago', null, false));
      await this.inserisciArticolo(
          Pokemon(783, 166, 'Hakamo-o', 'Drago', 'Lotta', false));
      await this.inserisciArticolo(
          Pokemon(784, 167, 'Kommo-o', 'Drago', 'Lotta', false));
      await this.inserisciArticolo(
          Pokemon(27, 168, 'Sandshrew', 'Terra', null, false));
      await this.inserisciArticolo(
          Pokemon(28, 169, 'Sandslash', 'Terra', null, false));
      await this
          .inserisciArticolo(Pokemon(104, 170, 'Cubone', 'Terra', null, false));
      await this.inserisciArticolo(
          Pokemon(105, 171, 'Marowak', 'Terra', null, false));
      await this.inserisciArticolo(
          Pokemon(115, 172, 'Kangaskhan', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(324, 173, 'Torkoal', 'Fuoco', null, false));
      await this.inserisciArticolo(
          Pokemon(843, 174, 'Silicobra', 'Terra', null, false));
      await this.inserisciArticolo(
          Pokemon(844, 175, 'Sandaconda', 'Terra', null, false));
      await this.inserisciArticolo(
          Pokemon(551, 176, 'Sandile', 'Terra', 'Buio', false));
      await this.inserisciArticolo(
          Pokemon(552, 177, 'Krokorok', 'Terra', 'Buio', false));
      await this.inserisciArticolo(
          Pokemon(553, 178, 'Krookodile', 'Terra', 'Buio', false));
      await this.inserisciArticolo(
          Pokemon(627, 179, 'Rufflet', 'Normale', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(628, 180, 'Braviary', 'Normale', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(629, 181, 'Vullaby', 'Buio', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(630, 182, 'Mandibuzz', 'Buio', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(111, 183, 'Rhyhorn', 'Terra', 'Roccia', false));
      await this.inserisciArticolo(
          Pokemon(112, 184, 'Rhydon', 'Terra', 'Roccia', false));
      await this.inserisciArticolo(
          Pokemon(464, 185, 'Rhyperior', 'Terra', 'Roccia', false));
      await this.inserisciArticolo(
          Pokemon(636, 186, 'Larvesta', 'Coleottero', 'Fuoco', false));
      await this.inserisciArticolo(
          Pokemon(637, 187, 'Volcarona', 'Coleottero', 'Fuoco', false));
      await this.inserisciArticolo(
          Pokemon(170, 188, 'Chinchou', 'Acqua', 'Elettro', false));
      await this.inserisciArticolo(
          Pokemon(171, 189, 'Lanturn', 'Acqua', 'Elettro', false));
      await this.inserisciArticolo(
          Pokemon(320, 190, 'Wailmer', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(321, 191, 'Wailord', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(592, 192, 'Frillish', 'Acqua', 'Spettro', false));
      await this.inserisciArticolo(
          Pokemon(593, 193, 'Jellicent', 'Acqua', 'Spettro', false));
      await this.inserisciArticolo(
          Pokemon(690, 194, 'Skrelp', 'Veleno', 'Acqua', false));
      await this.inserisciArticolo(
          Pokemon(691, 195, 'Dragalge', 'Veleno', 'Drago', false));
      await this.inserisciArticolo(
          Pokemon(692, 196, 'Clauncher', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(693, 197, 'Clawitzer', 'Acqua', null, false));
      await this
          .inserisciArticolo(Pokemon(116, 198, 'Horsea', 'Acqua', null, false));
      await this
          .inserisciArticolo(Pokemon(117, 199, 'Seadra', 'Acqua', null, false));
      await this.inserisciArticolo(
          Pokemon(230, 200, 'Kingdra', 'Acqua', 'Drago', false));
      await this
          .inserisciArticolo(Pokemon(548, 201, 'Petilil', 'Erba', null, false));
      await this.inserisciArticolo(
          Pokemon(549, 202, 'Lilligant', 'Erba', null, false));
      await this.inserisciArticolo(
          Pokemon(415, 203, 'Combee', 'Coleottero', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(416, 204, 'Vespiquen', 'Coleottero', 'Volante', false));
      await this.inserisciArticolo(
          Pokemon(102, 205, 'Exeggcute', 'Erba', 'Psico', false));
      await this.inserisciArticolo(
          Pokemon(103, 206, 'Exeggutor', 'Erba', 'Psico', false));
      await this.inserisciArticolo(
          Pokemon(132, 207, 'Ditto', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(137, 208, 'Porygon', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(233, 209, 'Porygon2', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(474, 210, 'Porygon-Z', 'Normale', null, false));
      await this.inserisciArticolo(
          Pokemon(893, 211, 'Zarude', 'Buio', 'Erba', false));
    } else {
      print('Il DB ha elementi');
      // eliminaDatiDb();
    }
  }

  Future inserisciArticolo(Pokemon pokemon) async {
    int id = await store
        .record(pokemon.idNazionale)
        .add(_db, pokemon.trasformaInMap());
    return id;
  }

  Future eliminaDatiDb() async {
    await store.delete(_db);
  }

  Future<List<Pokemon>> leggiListaPokemon(bool flgVisibilita) async {
    Finder finder;

    if (_db == null) {
      print('Sto aprendo il DB');
      await init();
    }

    if (flgVisibilita) {
      finder = Finder(sortOrders: [
        SortOrder('idRegionale'),
      ]);
    } else {
      finder = Finder(
          sortOrders: [SortOrder('idRegionale')],
          filter: Filter.equals('checkCatturato', false));
    }

    final pokemonSnapshot = await store.find(_db, finder: finder);
    return pokemonSnapshot.map((elemento) {
      final pokemon = Pokemon.daMap(elemento.value);
      pokemon.idNazionale = elemento.key;
      return pokemon;
    }).toList();
  }

  Future aggiornaPokemon(Pokemon pokemon) async {
    final finder = Finder(filter: Filter.byKey(pokemon.idNazionale));
    await store.update(_db, pokemon.trasformaInMap(), finder: finder);
  }
}
