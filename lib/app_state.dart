import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _modovendedor =
          await secureStorage.getBool('ff_modovendedor') ?? _modovendedor;
    });
    await _safeInitAsync(() async {
      _PaginaSeleccionada =
          await secureStorage.getString('ff_PaginaSeleccionada') ??
              _PaginaSeleccionada;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

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
    secureStorage.setBool('ff_modovendedor', value);
  }

  void deleteModovendedor() {
    secureStorage.delete(key: 'ff_modovendedor');
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

  String _PaginaSeleccionada = 'Home';
  String get PaginaSeleccionada => _PaginaSeleccionada;
  set PaginaSeleccionada(String value) {
    _PaginaSeleccionada = value;
    secureStorage.setString('ff_PaginaSeleccionada', value);
  }

  void deletePaginaSeleccionada() {
    secureStorage.delete(key: 'ff_PaginaSeleccionada');
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
