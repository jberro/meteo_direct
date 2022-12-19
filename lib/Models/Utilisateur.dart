class Utilisateur {
  String _nom;
  String _email;
  String _mdp;

  Utilisateur(this._nom, this._email, this._mdp);

  String get Nom {
    return _nom;
  }

  String get Email {
    return _email;
  }

  String get Mdp {
    return _mdp;
  }
}
