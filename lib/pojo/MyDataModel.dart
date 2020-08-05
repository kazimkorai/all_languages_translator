class MyDataModel
{

  int id;
  String _input;
  String _output;

  MyDataModel(this._input, this._output);

  MyDataModel.map(dynamic obj) {
  this._input = obj["input"];
  this._output = obj["output"];

  }

  String get input => _input;

  String get output => _output;



  Map<String, dynamic> toMap() {
  var map = new Map<String, dynamic>();

  map["input"] = _input;
  map["output"] = _output;


  return map;
  }

  void setId(int id) {
  this.id = id;
  }
  }



