import 'package:flutter/foundation.dart';
import 'package:start_flutter/models/currency.dart';

class CurrencyTable extends ChangeNotifier {
  List<Currency> _rates = [];
  String _tableNumber = '';
  String _tableType = '';
  DateTime _effectiveDate = DateTime(0);


  List<Currency> get rates => _rates;

  set rates(List<Currency> newRates) {
    _rates = newRates;
    notifyListeners();
  }

  String get tableNumber => _tableNumber;

  set tableNumber(String newTableNumber) {
    _tableNumber = newTableNumber;
    notifyListeners();
  }

  String get tableType => _tableType;

  set tableType(String newTableType) {
    Set<String> allowedTableTypes = {'a', 'b', 'c'};

    if(allowedTableTypes.contains(newTableType.toLowerCase())){
      _tableType = newTableType.toLowerCase();
      notifyListeners();
    }
  }

  DateTime get effectiveDate => _effectiveDate;

  set effectiveDate(DateTime newEffectiveDate) {
    DateTime archiveEarliestDate = DateTime(2002, 1, 2);
    //TODO refactor this if statement
    if(archiveEarliestDate.millisecondsSinceEpoch <= newEffectiveDate.millisecondsSinceEpoch
        && newEffectiveDate.millisecondsSinceEpoch <= DateTime.now().millisecondsSinceEpoch) {
      _effectiveDate = newEffectiveDate;
      notifyListeners();
    }
  }
}