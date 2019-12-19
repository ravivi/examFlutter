class PostResto {
  int id;
  String nom;
  String ville;
  String commune;

  String type;
  String sigle;
  String numero;
  String image;

  PostResto(
      {this.id,
      this.nom,
      this.ville,
      this.commune,
      this.type,
      this.sigle,
      this.numero,
      this.image
      });

  factory PostResto.fromJson(Map<String, dynamic> json) {
    return PostResto(
      id: json['id'],
      nom: json['nom'],
      ville: json['ville'],
      commune: json['commune'],
      type: json['type'],
      sigle: json['sigle'],
      numero: json['numero'],
      image: json['image'],
    );
  }
  factory PostResto.fromMap(Map<String, dynamic> map) {
    return PostResto(
      id: map['id'],
      nom: map['nom'],
      ville: map['ville'],
      commune: map['commune'],
      type: map['type'],
      sigle: map['sigle'],
      numero: map['numero'],
      image: map['image'],
    );
  }
  Map<String, dynamic> toMap() {
    var map = {
      'id': id,
      'nom': nom,
      'ville': ville,
      'commune': commune,
      'type': type,
      'sigle': sigle,
      'numero': numero,
      'image':image
    };
    return map;
  }
}
