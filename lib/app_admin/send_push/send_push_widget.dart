import '';
import '/backend/supabase/supabase.dart';
import '/empty_lists/empty_list_users_push/empty_list_users_push_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'send_push_model.dart';
export 'send_push_model.dart';

class SendPushWidget extends StatefulWidget {
  const SendPushWidget({super.key});

  static String routeName = 'send_push';
  static String routePath = '/sendPush';

  @override
  State<SendPushWidget> createState() => _SendPushWidgetState();
}

class _SendPushWidgetState extends State<SendPushWidget> {
  late SendPushModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SendPushModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.checkConnection(context);
    });

    _model.tituloTextController ??= TextEditingController();
    _model.tituloFocusNode ??= FocusNode();

    _model.descripcionTextController ??= TextEditingController();
    _model.descripcionFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Nueva Notificación',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 280.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mensaje',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextFormField(
                              controller: _model.tituloTextController,
                              focusNode: _model.tituloFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Título de la notificación',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              minLines: 1,
                              validator: _model.tituloTextControllerValidator
                                  .asValidator(context),
                            ),
                            TextFormField(
                              controller: _model.descripcionTextController,
                              focusNode: _model.descripcionFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Contenido del mensaje',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                alignLabelWithHint: true,
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              maxLines: 8,
                              minLines: 3,
                              maxLength: 250,
                              validator: _model
                                  .descripcionTextControllerValidator
                                  .asValidator(context),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 580.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Destinatarios',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            FutureBuilder<List<UsuariosRow>>(
                              future: UsuariosTable().queryRows(
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UsuariosRow> containerUsuariosRowList =
                                    snapshot.data!;

                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 110.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: Color(0xFFE0E0E0),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Buscar usuarios',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Flexible(
                                          child: FlutterFlowDropDown<String>(
                                            multiSelectController: _model
                                                    .usuariosValueController ??=
                                                FormListFieldController<String>(
                                                    null),
                                            options: List<String>.from(
                                                containerUsuariosRowList
                                                    .map((e) => e.id)
                                                    .toList()),
                                            optionLabels:
                                                containerUsuariosRowList
                                                    .map((e) => e.nombre)
                                                    .toList(),
                                            width: double.infinity,
                                            height: 40.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Usuarios',
                                            searchHintText:
                                                'Buscar usuarios...',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor: Color(0xFFF2F3F4),
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: true,
                                            isMultiSelect: true,
                                            onMultiSelectChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.usuariosValue = val);
                                              _model.userslist =
                                                  await UsuariosTable()
                                                      .queryRows(
                                                queryFn: (q) =>
                                                    q.inFilterOrNull(
                                                  'id',
                                                  _model.usuariosValue,
                                                ),
                                              );
                                              while (_model.index! <=
                                                  _model.userslist!.length) {
                                                _model.addToUsuarios((_model
                                                    .userslist!
                                                    .elementAtOrNull(
                                                        _model.index!))!);
                                                safeSetState(() {});
                                                _model.index =
                                                    _model.index! + 1;
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 360.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFE0E0E0),
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Filtros',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Verificación',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    FlutterFlowCheckboxGroup(
                                      options: ['Verificados', 'Sin verificar'],
                                      onChanged: (val) async {
                                        safeSetState(() =>
                                            _model.verificadosValues = val);
                                        _model.verificados = _model
                                            .verificadosValues!
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                      },
                                      controller:
                                          _model.verificadosValueController ??=
                                              FormFieldController<List<String>>(
                                        [],
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                      checkboxBorderColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                      checkboxBorderRadius:
                                          BorderRadius.circular(4.0),
                                      initialized:
                                          _model.verificadosValues != null,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Estado de la suscripcion',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    FlutterFlowCheckboxGroup(
                                      options: [
                                        'Suscripción activa',
                                        'Suscripción no activa'
                                      ],
                                      onChanged: (val) async {
                                        safeSetState(() => _model
                                            .estadosuscripcionValues = val);
                                        _model.suscripcionactiva = _model
                                            .estadosuscripcionValues!
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                      },
                                      controller: _model
                                              .estadosuscripcionValueController ??=
                                          FormFieldController<List<String>>(
                                        [],
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                      checkboxBorderColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                      checkboxBorderRadius:
                                          BorderRadius.circular(4.0),
                                      initialized:
                                          _model.estadosuscripcionValues !=
                                              null,
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.verificadosValues?.length ==
                                            2) {
                                          if (_model.estadosuscripcionValues
                                                  ?.length ==
                                              2) {
                                            _model.usuarios13 =
                                                await UsuariosTable().queryRows(
                                              queryFn: (q) => q.eqOrNull(
                                                'is_deleted',
                                                false,
                                              ),
                                            );
                                            _model.usuarios = _model.usuarios13!
                                                .toList()
                                                .cast<UsuariosRow>();
                                            safeSetState(() {});
                                          } else if (_model
                                                  .estadosuscripcionValues
                                                  ?.length ==
                                              1) {
                                            if (functions.arraycontainsstring(
                                                'Suscripción activa',
                                                _model.suscripcionactiva
                                                    .toList())!) {
                                              _model.usuarios14 =
                                                  await UsuariosTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'is_deleted',
                                                      false,
                                                    )
                                                    .eqOrNull(
                                                      'suscripcion_activa',
                                                      true,
                                                    ),
                                              );
                                              _model.usuarios = _model
                                                  .usuarios14!
                                                  .toList()
                                                  .cast<UsuariosRow>();
                                              safeSetState(() {});
                                            } else {
                                              _model.usuarios15 =
                                                  await UsuariosTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'is_deleted',
                                                      false,
                                                    )
                                                    .eqOrNull(
                                                      'suscripcion_activa',
                                                      false,
                                                    ),
                                              );
                                              _model.usuarios = _model
                                                  .usuarios15!
                                                  .toList()
                                                  .cast<UsuariosRow>();
                                              safeSetState(() {});
                                            }
                                          } else {
                                            _model.usuarios16 =
                                                await UsuariosTable().queryRows(
                                              queryFn: (q) => q.eqOrNull(
                                                'is_deleted',
                                                false,
                                              ),
                                            );
                                            _model.usuarios = _model.usuarios16!
                                                .toList()
                                                .cast<UsuariosRow>();
                                            safeSetState(() {});
                                          }
                                        } else if (_model
                                                .verificadosValues?.length ==
                                            1) {
                                          if (functions.arraycontainsstring(
                                              'Verificados',
                                              _model.verificados.toList())!) {
                                            if (_model.estadosuscripcionValues
                                                    ?.length ==
                                                2) {
                                              _model.usuarios2 =
                                                  await UsuariosTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'is_deleted',
                                                      false,
                                                    )
                                                    .eqOrNull(
                                                      'verified',
                                                      true,
                                                    ),
                                              );
                                              _model.usuarios = _model
                                                  .usuarios2!
                                                  .toList()
                                                  .cast<UsuariosRow>();
                                              safeSetState(() {});
                                            } else if (_model
                                                    .estadosuscripcionValues
                                                    ?.length ==
                                                1) {
                                              if (functions.arraycontainsstring(
                                                  'Suscripción activa',
                                                  _model.estadosuscripcionValues
                                                      ?.toList())!) {
                                                _model.usuarios3 =
                                                    await UsuariosTable()
                                                        .queryRows(
                                                  queryFn: (q) => q
                                                      .eqOrNull(
                                                        'is_deleted',
                                                        false,
                                                      )
                                                      .eqOrNull(
                                                        'verified',
                                                        true,
                                                      )
                                                      .eqOrNull(
                                                        'suscripcion_activa',
                                                        true,
                                                      ),
                                                );
                                                _model.usuarios = _model
                                                    .usuarios3!
                                                    .toList()
                                                    .cast<UsuariosRow>();
                                                safeSetState(() {});
                                              } else {
                                                _model.usuarios4 =
                                                    await UsuariosTable()
                                                        .queryRows(
                                                  queryFn: (q) => q
                                                      .eqOrNull(
                                                        'is_deleted',
                                                        false,
                                                      )
                                                      .eqOrNull(
                                                        'verified',
                                                        true,
                                                      )
                                                      .eqOrNull(
                                                        'suscripcion_activa',
                                                        false,
                                                      ),
                                                );
                                                _model.usuarios = _model
                                                    .usuarios4!
                                                    .toList()
                                                    .cast<UsuariosRow>();
                                                safeSetState(() {});
                                              }
                                            } else {
                                              _model.usuarios5 =
                                                  await UsuariosTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'is_deleted',
                                                      false,
                                                    )
                                                    .eqOrNull(
                                                      'verified',
                                                      true,
                                                    ),
                                              );
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(_model
                                                        .usuarios5!.length
                                                        .toString()),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              _model.usuarios = _model
                                                  .usuarios5!
                                                  .toList()
                                                  .cast<UsuariosRow>();
                                              safeSetState(() {});
                                            }
                                          } else {
                                            if (_model.estadosuscripcionValues
                                                    ?.length ==
                                                2) {
                                              _model.usuarios6 =
                                                  await UsuariosTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'is_deleted',
                                                      false,
                                                    )
                                                    .eqOrNull(
                                                      'verified',
                                                      false,
                                                    ),
                                              );
                                              _model.usuarios = _model
                                                  .usuarios6!
                                                  .toList()
                                                  .cast<UsuariosRow>();
                                              safeSetState(() {});
                                            } else if (_model
                                                    .estadosuscripcionValues
                                                    ?.length ==
                                                1) {
                                              if (functions.arraycontainsstring(
                                                  'Suscripción activa',
                                                  _model.suscripcionactiva
                                                      .toList())!) {
                                                _model.usuarios7 =
                                                    await UsuariosTable()
                                                        .queryRows(
                                                  queryFn: (q) => q
                                                      .eqOrNull(
                                                        'is_deleted',
                                                        false,
                                                      )
                                                      .eqOrNull(
                                                        'verified',
                                                        false,
                                                      )
                                                      .eqOrNull(
                                                        'suscripcion_activa',
                                                        true,
                                                      ),
                                                );
                                                _model.usuarios = _model
                                                    .usuarios7!
                                                    .toList()
                                                    .cast<UsuariosRow>();
                                                safeSetState(() {});
                                              } else {
                                                _model.usuarios8 =
                                                    await UsuariosTable()
                                                        .queryRows(
                                                  queryFn: (q) => q
                                                      .eqOrNull(
                                                        'is_deleted',
                                                        false,
                                                      )
                                                      .eqOrNull(
                                                        'verified',
                                                        false,
                                                      )
                                                      .eqOrNull(
                                                        'suscripcion_activa',
                                                        false,
                                                      ),
                                                );
                                                _model.usuarios = _model
                                                    .usuarios8!
                                                    .toList()
                                                    .cast<UsuariosRow>();
                                                safeSetState(() {});
                                              }
                                            } else {
                                              _model.usuarios9 =
                                                  await UsuariosTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'is_deleted',
                                                      false,
                                                    )
                                                    .eqOrNull(
                                                      'verified',
                                                      false,
                                                    ),
                                              );
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 3000));
                                              _model.usuarios = _model
                                                  .usuarios9!
                                                  .toList()
                                                  .cast<UsuariosRow>();
                                              safeSetState(() {});
                                            }
                                          }
                                        } else {
                                          if (_model.estadosuscripcionValues
                                                  ?.length ==
                                              2) {
                                            _model.usuarios10 =
                                                await UsuariosTable().queryRows(
                                              queryFn: (q) => q.eqOrNull(
                                                'is_deleted',
                                                false,
                                              ),
                                            );
                                            _model.usuarios = _model.usuarios10!
                                                .toList()
                                                .cast<UsuariosRow>();
                                            safeSetState(() {});
                                          } else if (_model
                                                  .estadosuscripcionValues
                                                  ?.length ==
                                              1) {
                                            if (_model.estadosuscripcionValues
                                                    ?.firstOrNull ==
                                                'Suscripción activa') {
                                              _model.usuarios11 =
                                                  await UsuariosTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'is_deleted',
                                                      false,
                                                    )
                                                    .eqOrNull(
                                                      'suscripcion_activa',
                                                      true,
                                                    ),
                                              );
                                              _model.usuarios = _model
                                                  .usuarios11!
                                                  .toList()
                                                  .cast<UsuariosRow>();
                                              safeSetState(() {});
                                            } else {
                                              _model.usuarios12 =
                                                  await UsuariosTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'is_deleted',
                                                      false,
                                                    )
                                                    .eqOrNull(
                                                      'suscripcion_activa',
                                                      false,
                                                    ),
                                              );
                                              _model.usuarios = _model
                                                  .usuarios12!
                                                  .toList()
                                                  .cast<UsuariosRow>();
                                              safeSetState(() {});
                                            }
                                          }
                                        }

                                        safeSetState(() {});
                                      },
                                      text: 'Sumar usuarios',
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color: Color(0xFF1C2A3A),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Color(0xFF1C2A3A),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(28.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 350.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Usuarios seleccionados',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 200.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFE0E0E0),
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child: Builder(
                                  builder: (context) {
                                    final users = _model.usuarios.toList();
                                    if (users.isEmpty) {
                                      return EmptyListUsersPushWidget();
                                    }

                                    return SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(users.length,
                                            (usersIndex) {
                                          final usersItem = users[usersIndex];
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '${valueOrDefault<String>(
                                                        usersItem.nombre,
                                                        'Nada',
                                                      )} ${valueOrDefault<String>(
                                                        usersItem.apellido,
                                                        'Nada 2',
                                                      )}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.removeFromUsuarios(
                                                      usersItem);
                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  size: 20.0,
                                                ),
                                              ),
                                            ],
                                          );
                                        }).divide(SizedBox(height: 12.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${valueOrDefault<String>(
                                    _model.usuarios.length.toString(),
                                    '-',
                                  )} usuarios',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF1F2A37),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {},
                    text: 'Enviar notificación',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF1C2A3A),
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Inter Tight',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
