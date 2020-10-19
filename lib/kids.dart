class Kids {
  int _id;
  String _name;
  String _section;
  double _stars;

  Kids(this._id, this._name, this._section, this._stars);

  set id(int id) {
    this._id = id;
  }

  set name(String name) {
    this._name = name;
  }

  set section(String section) {
    this._section = section;
  }

  set stars(double stars) {
    this._stars = stars;
  }

  int get id => this._id;
  String get name => this._name;
  String get section => this._section;
  double get stars => this._stars;
}
