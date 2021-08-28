import 'dart:convert';

class Currency {
  String name = "";
  String code = "";
  double rate = 0.0;

  Currency(this.name, this.code, this.rate);

  static List<Currency> nbpJson2List(String json) {
    Map map = jsonDecode(json);
    List<Currency> list = [];
    for (Map rate in map['rates']){
      list.add(
          Currency(
            rate['currency'],
            rate['code'],
            rate['mid'],
          ));
    }
    return list;
  }
}