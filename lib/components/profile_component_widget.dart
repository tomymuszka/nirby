import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/todas/delete_account/delete_account_widget.dart';
import '/todas/loading/loading_widget.dart';
import '/todas/log_out/log_out_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'profile_component_model.dart';
export 'profile_component_model.dart';

class ProfileComponentWidget extends StatefulWidget {
  const ProfileComponentWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    this.parameter6,
    this.parameter7,
    this.parameter8,
    this.parameter9,
    this.parameter10,
    this.parameter11,
    this.parameter12,
    this.parameter13,
    this.parameter14,
    required this.emailconfirmado,
  });

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;
  final String? parameter4;
  final int? parameter5;
  final DateTime? parameter6;
  final String? parameter7;
  final bool? parameter8;
  final String? parameter9;
  final bool? parameter10;
  final String? parameter11;
  final bool? parameter12;
  final bool? parameter13;
  final bool? parameter14;
  final bool? emailconfirmado;

  @override
  State<ProfileComponentWidget> createState() => _ProfileComponentWidgetState();
}

class _ProfileComponentWidgetState extends State<ProfileComponentWidget> {
  late ProfileComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileComponentModel());

    _model.switchValue = FFAppState().modovendedor == true ? true : false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              widget.parameter1!,
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '${widget.parameter2} ${widget.parameter3}',
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
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        widget.parameter4!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Color(0xFF6B7280),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (widget.emailconfirmado ?? true)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Color(0xFF2B7A4B),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 2.0, 0.0, 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.check,
                                            color: Color(0xFF28A745),
                                            size: 14.0,
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Text(
                                                'Email verificado',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFF28A745),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.parameter8 ?? true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            if (FFAppState().modovendedor) {
                              FFAppState().modovendedor = false;
                              FFAppState().update(() {});
                            } else {
                              if ((widget.parameter5 != null) &&
                                  (widget.parameter6 != null) &&
                                  (widget.parameter7 != null &&
                                      widget.parameter7 != '')) {
                                FFAppState().modovendedor = true;
                                FFAppState().update(() {});
                              } else {
                                context
                                    .goNamed(CompleteprofileWidget.routeName);

                                return;
                              }
                            }
                          },
                          text: FFAppState().modovendedor
                              ? 'Pasar a modo cliente'
                              : 'Pasar a modo vendedor',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF3D64FF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (currentUserUid == 'tgh')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 15.0, 0.0),
                          child: Text(
                            _model.switchValue!
                                ? 'Estás en modo vendedor'
                                : 'Estás en modo cliente',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Switch.adaptive(
                          value: _model.switchValue!,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.switchValue = newValue);
                            if (newValue) {
                              if ((widget.parameter5 != null) &&
                                  (widget.parameter6 != null) &&
                                  (widget.parameter7 != null &&
                                      widget.parameter7 != '')) {
                                FFAppState().modovendedor = true;
                                FFAppState().update(() {});
                              } else {
                                context
                                    .goNamed(CompleteprofileWidget.routeName);

                                return;
                              }
                            } else {
                              FFAppState().modovendedor = false;
                              FFAppState().update(() {});
                            }
                          },
                          activeColor: Color(0xFFCACACA),
                          activeTrackColor: Colors.green,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).alternate,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          if (widget.parameter13 ?? true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      FFAppState().foto = widget.parameter9!;
                      FFAppState().fechaNacimiento = widget.parameter6;
                      safeSetState(() {});

                      context.pushNamed(EditarPerfilWidget.routeName);
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.person_outline_rounded,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Editar perfil',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  if (FFAppState().modovendedor)
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      indent: 10.0,
                      endIndent: 10.0,
                      color: Color(0xFFE5E7EB),
                    ),
                  if (FFAppState().modovendedor)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context
                            .pushNamed(CategoriasProfesionalWidget.routeName);
                      },
                      child: Material(
                        color: Colors.transparent,
                        child: ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.list,
                            color: Color(0xFF1C2A3A),
                          ),
                          title: Text(
                            'Categorías',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF6B7280),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 15.0,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          dense: false,
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().modovendedor)
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      indent: 10.0,
                      endIndent: 10.0,
                      color: Color(0xFFE5E7EB),
                    ),
                  if (FFAppState().modovendedor)
                    Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: LoadingWidget(),
                              );
                            },
                          );

                          if (widget.parameter12!) {
                            Navigator.pop(context);

                            context.pushNamed(VerifyinprocessWidget.routeName);
                          } else {
                            if (widget.parameter10!) {
                              if (widget.parameter11 != null &&
                                  widget.parameter11 != '') {
                                _model.suscrip2 =
                                    await EdgeFunctionsGroup.getsuscCall.call(
                                  id: widget.parameter11,
                                );

                                if (EdgeFunctionsGroup.getsuscCall.status(
                                      (_model.suscrip2?.jsonBody ?? ''),
                                    ) ==
                                    'authorized') {
                                  Navigator.pop(context);

                                  context.pushNamed(
                                    ActiveSuscriptionWidget.routeName,
                                    queryParameters: {
                                      'amount': serializeParam(
                                        EdgeFunctionsGroup.getsuscCall
                                            .amount(
                                              (_model.suscrip2?.jsonBody ?? ''),
                                            )
                                            ?.toDouble(),
                                        ParamType.double,
                                      ),
                                      'fechafacturacion': serializeParam(
                                        EdgeFunctionsGroup.getsuscCall
                                            .fechafacturacion(
                                          (_model.suscrip2?.jsonBody ?? ''),
                                        ),
                                        ParamType.String,
                                      ),
                                      'frecuencia': serializeParam(
                                        EdgeFunctionsGroup.getsuscCall
                                            .frecuencia(
                                          (_model.suscrip2?.jsonBody ?? ''),
                                        ),
                                        ParamType.int,
                                      ),
                                      'idsuscripcion': serializeParam(
                                        widget.parameter11,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  Navigator.pop(context);

                                  context.pushNamed(PaymentWidget.routeName);
                                }
                              } else {
                                Navigator.pop(context);

                                context.pushNamed(PaymentWidget.routeName);
                              }
                            } else {
                              Navigator.pop(context);

                              context.pushNamed(VeridyIdentityWidget.routeName);
                            }
                          }

                          safeSetState(() {});
                        },
                        child: Material(
                          color: Colors.transparent,
                          child: ListTile(
                            leading: Icon(
                              Icons.payment,
                              color: Color(0xFF1C2A3A),
                            ),
                            title: Text(
                              'Tu suscripción',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 15.0,
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            dense: false,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Color(0xFFE5E7EB),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await launchURL('https://wa.me/5491168551414');
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.help_outline,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Ayuda y soporte',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Color(0xFFE5E7EB),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(TerminosCondicionesWidget.routeName);
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.security,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Términos y condiciones',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Color(0xFFE5E7EB),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: 300.0,
                              child: DeleteAccountWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.delete_outline,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Eliminar cuenta',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Color(0xFFE5E7EB),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: 200.0,
                              child: LogOutWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Cerrar sesión',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (widget.parameter14 ?? true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      FFAppState().foto = widget.parameter9!;
                      FFAppState().fechaNacimiento = widget.parameter6;
                      safeSetState(() {});

                      context.pushNamed(EditarPerfilWidget.routeName);
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.person_outline_rounded,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Editar perfil',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Color(0xFFE5E7EB),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(AlertasDeServicioWidget.routeName);
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.add_alert_outlined,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Alertas de servicio',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Color(0xFFE5E7EB),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(ChatsAdminWidget.routeName);
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.chat_outlined,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Chats',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Color(0xFFE5E7EB),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(SendPushWidget.routeName);
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.notifications_outlined,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Notificaciones',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Color(0xFFE5E7EB),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(AjustesGlobalesWidget.routeName);
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.globe,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Ajustes globales',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Color(0xFFE5E7EB),
                  ),
                  if (currentUserUid == '1')
                    Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.share,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Compartir',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Color(0xFFE5E7EB),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(TerminosCondicionesWidget.routeName);
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.security,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Términos y condiciones',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Color(0xFFE5E7EB),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: 300.0,
                              child: DeleteAccountWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.delete_outline,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Eliminar cuenta',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Color(0xFFE5E7EB),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: 200.0,
                              child: LogOutWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Color(0xFF1C2A3A),
                        ),
                        title: Text(
                          'Cerrar sesión',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF6B7280),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 15.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                'Versión 1.0.22',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
