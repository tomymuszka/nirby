import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'categorias_profesional_model.dart';
export 'categorias_profesional_model.dart';

class CategoriasProfesionalWidget extends StatefulWidget {
  const CategoriasProfesionalWidget({super.key});

  static String routeName = 'categorias_profesional';
  static String routePath = '/categoriasProfesional';

  @override
  State<CategoriasProfesionalWidget> createState() =>
      _CategoriasProfesionalWidgetState();
}

class _CategoriasProfesionalWidgetState
    extends State<CategoriasProfesionalWidget> {
  late CategoriasProfesionalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriasProfesionalModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.checkConnection(context);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsuarioCategoriasInteresRow>>(
      future: UsuarioCategoriasInteresTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primaryBackground,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsuarioCategoriasInteresRow>
            categoriasProfesionalUsuarioCategoriasInteresRowList =
            snapshot.data!;

        final categoriasProfesionalUsuarioCategoriasInteresRow =
            categoriasProfesionalUsuarioCategoriasInteresRowList.isNotEmpty
                ? categoriasProfesionalUsuarioCategoriasInteresRowList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 600.0,
                  ),
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: Color(0x004B39EF),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Categorías',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Text(
                                  'Acá podés seleccionar todas las categorías sobre las que te interesa recibir notificaciones cuando los clientes creen una alerta de servicio.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 20.0, 0.0),
                          child: FutureBuilder<List<CategoriasRow>>(
                            future: CategoriasTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'is_deleted',
                                false,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<CategoriasRow>
                                  checkboxGroupCategoriasRowList =
                                  snapshot.data!;

                              return FlutterFlowCheckboxGroup(
                                options: checkboxGroupCategoriasRowList
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (val) => safeSetState(
                                    () => _model.checkboxGroupValues = val),
                                controller:
                                    _model.checkboxGroupValueController ??=
                                        FormFieldController<List<String>>(
                                  List.from(
                                      categoriasProfesionalUsuarioCategoriasInteresRow
                                              ?.categoriaNombres ??
                                          []),
                                ),
                                activeColor: Color(0xFF3D64FF),
                                checkColor: FlutterFlowTheme.of(context).info,
                                checkboxBorderColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                checkboxBorderRadius:
                                    BorderRadius.circular(4.0),
                                initialized: _model.checkboxGroupValues != null,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 40.0, 20.0, 40.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.categorias =
                                        await CategoriasTable().queryRows(
                                      queryFn: (q) => q.inFilterOrNull(
                                        'name',
                                        _model.checkboxGroupValues,
                                      ),
                                    );
                                    await UsuariosTable().update(
                                      data: {
                                        'interested_categories': _model
                                            .categorias
                                            ?.map((e) => e.id)
                                            .toList(),
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'id',
                                        currentUserUid,
                                      ),
                                    );
                                    context.safePop();

                                    safeSetState(() {});
                                  },
                                  text: 'Guardar',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF1C2A3A),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
