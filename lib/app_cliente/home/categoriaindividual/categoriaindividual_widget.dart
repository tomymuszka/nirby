import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'categoriaindividual_model.dart';
export 'categoriaindividual_model.dart';

/// Componente de una categoria individual
class CategoriaindividualWidget extends StatefulWidget {
  const CategoriaindividualWidget({
    super.key,
    required this.name,
    required this.backgroundcolor,
  });

  final String? name;
  final Color? backgroundcolor;

  @override
  State<CategoriaindividualWidget> createState() =>
      _CategoriaindividualWidgetState();
}

class _CategoriaindividualWidgetState extends State<CategoriaindividualWidget> {
  late CategoriaindividualModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriaindividualModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 130.0,
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 10.0,
            shape: const CircleBorder(),
            child: Container(
              width: 62.0,
              height: 62.0,
              decoration: BoxDecoration(
                color: widget.backgroundcolor,
                shape: BoxShape.circle,
              ),
              child: Builder(
                builder: (context) {
                  if (widget.name == 'Albañilería') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.construction_sharp,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Carpintería') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.hammer,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Cerrajería') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.key,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Clases y cursos') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.menu_book_sharp,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Climatización') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.fire,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Cuidado personal y familiar') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.family_restroom,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Decoración de interior') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.couch,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Electricidad') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.lightbulb,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Fumigación y control de plagas') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.bug,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Herrería') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.hammer,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Jardinería') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.leaf,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Limpieza') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.broom,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Mantenimiento para piscinas') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.swimmingPool,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Mudanzas y depósitos') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.box,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Pintura') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.paintRoller,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Plomería y Gas') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.faucet,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Reformas y remodelaciones') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.tools,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name ==
                      'Reparación de electrodomésticos') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.screwdriver,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Salud y belleza') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.heart,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Seguridad para el hogar') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.shieldAlt,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name ==
                      'Servicios de tecnología y entretenimiento') {
                    return Icon(
                      Icons.laptop,
                      color: Colors.white,
                      size: 24.0,
                    );
                  } else if (widget.name == 'Servicios para mascotas') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.paw,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else if (widget.name == 'Techos y canaletas') {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.houseDamage,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  } else {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.question,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    valueOrDefault<String>(
                      widget.name,
                      'Sin nombre',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Color(0xFF4B5563),
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
