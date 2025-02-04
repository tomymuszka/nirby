import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _modovendedor = prefs.getBool('ff_modovendedor') ?? _modovendedor;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _phone = '';
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
  }

  String _foto =
      'https://hjqqszvninihwpxrknjm.supabase.co/storage/v1/object/public/fotos/imagePlaceHolder.jpeg';
  String get foto => _foto;
  set foto(String value) {
    _foto = value;
  }

  DateTime? _fechaNacimiento;
  DateTime? get fechaNacimiento => _fechaNacimiento;
  set fechaNacimiento(DateTime? value) {
    _fechaNacimiento = value;
  }

  String _emailRegistro = '';
  String get emailRegistro => _emailRegistro;
  set emailRegistro(String value) {
    _emailRegistro = value;
  }

  String _contrasenaRegistro = '';
  String get contrasenaRegistro => _contrasenaRegistro;
  set contrasenaRegistro(String value) {
    _contrasenaRegistro = value;
  }

  List<String> _filtrozonacobertura = [
    'CABA',
    'Zona sur',
    'Zona oeste',
    'Zona norte',
    'No aplica'
  ];
  List<String> get filtrozonacobertura => _filtrozonacobertura;
  set filtrozonacobertura(List<String> value) {
    _filtrozonacobertura = value;
  }

  void addToFiltrozonacobertura(String value) {
    filtrozonacobertura.add(value);
  }

  void removeFromFiltrozonacobertura(String value) {
    filtrozonacobertura.remove(value);
  }

  void removeAtIndexFromFiltrozonacobertura(int index) {
    filtrozonacobertura.removeAt(index);
  }

  void updateFiltrozonacoberturaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filtrozonacobertura[index] = updateFn(_filtrozonacobertura[index]);
  }

  void insertAtIndexInFiltrozonacobertura(int index, String value) {
    filtrozonacobertura.insert(index, value);
  }

  bool _modovendedor = false;
  bool get modovendedor => _modovendedor;
  set modovendedor(bool value) {
    _modovendedor = value;
    prefs.setBool('ff_modovendedor', value);
  }

  List<String> _presupuesto = ['Sin cargo', 'Con cargo'];
  List<String> get presupuesto => _presupuesto;
  set presupuesto(List<String> value) {
    _presupuesto = value;
  }

  void addToPresupuesto(String value) {
    presupuesto.add(value);
  }

  void removeFromPresupuesto(String value) {
    presupuesto.remove(value);
  }

  void removeAtIndexFromPresupuesto(int index) {
    presupuesto.removeAt(index);
  }

  void updatePresupuestoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    presupuesto[index] = updateFn(_presupuesto[index]);
  }

  void insertAtIndexInPresupuesto(int index, String value) {
    presupuesto.insert(index, value);
  }

  List<String> _fotossubidas = [];
  List<String> get fotossubidas => _fotossubidas;
  set fotossubidas(List<String> value) {
    _fotossubidas = value;
  }

  void addToFotossubidas(String value) {
    fotossubidas.add(value);
  }

  void removeFromFotossubidas(String value) {
    fotossubidas.remove(value);
  }

  void removeAtIndexFromFotossubidas(int index) {
    fotossubidas.removeAt(index);
  }

  void updateFotossubidasAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    fotossubidas[index] = updateFn(_fotossubidas[index]);
  }

  void insertAtIndexInFotossubidas(int index, String value) {
    fotossubidas.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
