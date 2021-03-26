class Pokemon {
  int idNazionale;
  int idRegionale;
  String nome;
  String tipo1;
  String tipo2;
  bool checkCatturato;

  Pokemon(this.idNazionale, this.idRegionale, this.nome, this.tipo1, this.tipo2,
      this.checkCatturato);

  Map<String, dynamic> trasformaInMap() {
    return {
      'idNazionale': idNazionale,
      'idRegionale': idRegionale,
      'nome': nome,
      'tipo1': tipo1,
      'tipo2': tipo2,
      'checkCatturato': checkCatturato
    };
  }

  Pokemon.daMap(Map<String, dynamic> map) {
    idNazionale = map['idNazionale'];
    idRegionale = map['idRegionale'];
    nome = map['nome'];
    tipo1 = map['tipo1'];
    tipo2 = map['tipo2'];
    checkCatturato = map['checkCatturato'];
  }
}
