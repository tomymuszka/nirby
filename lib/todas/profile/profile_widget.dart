import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/todas/delete_account/delete_account_widget.dart';
import '/todas/loading/loading_widget.dart';
import '/todas/log_out/log_out_widget.dart';
import '/todas/navbar/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'profile_model.dart';
export 'profile_model.dart';

/// Pagina de mi cuenta
class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    _model.switchValue = FFAppState().modovendedor == true ? true : false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<UsuariosRow>>(
      future: UsuariosTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsuariosRow> profileUsuariosRowList = snapshot.data!;

        final profileUsuariosRow = profileUsuariosRowList.isNotEmpty
            ? profileUsuariosRowList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Text(
                'Mi cuenta',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      color: const Color(0xFF374151),
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 600.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    profileUsuariosRow?.foto,
                                                    'https://hjqqszvninihwpxrknjm.supabase.co/storage/v1/object/public/fotos/imagePlaceHolder.jpeg',
                                                  ),
                                                  width: 80.0,
                                                  height: 80.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      25.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            '${profileUsuariosRow?.nombre} ${profileUsuariosRow?.apellido}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: const Color(
                                                                      0xFF1F2A37),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              profileUsuariosRow
                                                                  ?.email,
                                                              'sin mail',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: const Color(
                                                                      0xFF6B7280),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
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
                                        ],
                                      ),
                                    ),
                                    if (!profileUsuariosRow!.admin!)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              _model.switchValue!
                                                  ? 'Estás en modo vendedor'
                                                  : 'Estás en modo cliente',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Switch.adaptive(
                                              value: _model.switchValue!,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                    .switchValue = newValue);
                                                if (newValue) {
                                                  if ((profileUsuariosRow.anosexperiencia != null) &&
                                                      (profileUsuariosRow
                                                              .fechaNacimiento !=
                                                          null) &&
                                                      (profileUsuariosRow
                                                                  .titulo !=
                                                              null &&
                                                          profileUsuariosRow
                                                                  .titulo !=
                                                              '')) {
                                                    FFAppState().modovendedor =
                                                        true;
                                                    safeSetState(() {});
                                                  } else {
                                                    context.pushNamed(
                                                        'informacioprofesional');

                                                    return;
                                                  }
                                                } else {
                                                  FFAppState().modovendedor =
                                                      false;
                                                  safeSetState(() {});
                                                }
                                              },
                                              activeColor: const Color(0xFFCACACA),
                                              activeTrackColor: Colors.green,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (!profileUsuariosRow.admin!)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 15.0, 10.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().foto =
                                              profileUsuariosRow.foto!;
                                          FFAppState().fechaNacimiento =
                                              profileUsuariosRow
                                                  .fechaNacimiento;
                                          safeSetState(() {});

                                          context.pushNamed('editar_perfil');
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.person_outline_rounded,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Editar perfil',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (FFAppState().modovendedor)
                                        const Divider(
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
                                            context.pushNamed(
                                                'categorias_profesional');
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              leading: const FaIcon(
                                                FontAwesomeIcons.list,
                                                color: Color(0xFF1C2A3A),
                                              ),
                                              title: Text(
                                                'Categorías',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF6B7280),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 15.0,
                                              ),
                                              tileColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              dense: false,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (!FFAppState().modovendedor)
                                        const Divider(
                                          height: 1.0,
                                          thickness: 1.0,
                                          indent: 10.0,
                                          endIndent: 10.0,
                                          color: Color(0xFFE5E7EB),
                                        ),
                                      if (FFAppState().modovendedor)
                                        const Divider(
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
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: const LoadingWidget(),
                                                    ),
                                                  );
                                                },
                                              );

                                              if (profileUsuariosRow
                                                  .enVerificacion!) {
                                                Navigator.pop(context);

                                                context.pushNamed(
                                                    'verifyinprocess');
                                              } else {
                                                if (profileUsuariosRow
                                                    .verified!) {
                                                  if (profileUsuariosRow
                                                              .idsuscripcion !=
                                                          null &&
                                                      profileUsuariosRow
                                                              .idsuscripcion !=
                                                          '') {
                                                    _model.suscrip2 =
                                                        await EdgeFunctionsGroup
                                                            .getsuscCall
                                                            .call(
                                                      id: profileUsuariosRow
                                                          .idsuscripcion,
                                                    );

                                                    if (EdgeFunctionsGroup
                                                            .getsuscCall
                                                            .status(
                                                          (_model.suscrip2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        'authorized') {
                                                      Navigator.pop(context);

                                                      context.pushNamed(
                                                        'active_suscription',
                                                        queryParameters: {
                                                          'amount':
                                                              serializeParam(
                                                            EdgeFunctionsGroup
                                                                .getsuscCall
                                                                .amount(
                                                                  (_model.suscrip2
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                                ?.toDouble(),
                                                            ParamType.double,
                                                          ),
                                                          'fechafacturacion':
                                                              serializeParam(
                                                            EdgeFunctionsGroup
                                                                .getsuscCall
                                                                .fechafacturacion(
                                                              (_model.suscrip2
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            ParamType.String,
                                                          ),
                                                          'frecuencia':
                                                              serializeParam(
                                                            EdgeFunctionsGroup
                                                                .getsuscCall
                                                                .frecuencia(
                                                              (_model.suscrip2
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            ParamType.int,
                                                          ),
                                                          'idsuscripcion':
                                                              serializeParam(
                                                            profileUsuariosRow
                                                                .idsuscripcion,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      Navigator.pop(context);

                                                      context
                                                          .pushNamed('payment');
                                                    }
                                                  } else {
                                                    Navigator.pop(context);

                                                    context
                                                        .pushNamed('payment');
                                                  }
                                                } else {
                                                  Navigator.pop(context);

                                                  context.pushNamed(
                                                      'veridyIdentity');
                                                }
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              child: ListTile(
                                                leading: const Icon(
                                                  Icons.payment,
                                                  color: Color(0xFF1C2A3A),
                                                ),
                                                title: Text(
                                                  'Tu suscripción',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 15.0,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                dense: false,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 0.0,
                                                            12.0, 0.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (FFAppState().modovendedor)
                                        const Divider(
                                          height: 1.0,
                                          thickness: 1.0,
                                          indent: 10.0,
                                          endIndent: 10.0,
                                          color: Color(0xFFE5E7EB),
                                        ),
                                      const Divider(
                                        height: 1.0,
                                        thickness: 1.0,
                                        indent: 10.0,
                                        endIndent: 10.0,
                                        color: Color(0xFFE5E7EB),
                                      ),
                                      if (currentUserUid == '1')
                                        Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Share.share(
                                                'nirby://nirby.com${GoRouterState.of(context).uri.toString()}',
                                                sharePositionOrigin:
                                                    getWidgetBoundingBox(
                                                        context),
                                              );
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              child: ListTile(
                                                leading: const Icon(
                                                  Icons.share,
                                                  color: Color(0xFF1C2A3A),
                                                ),
                                                title: Text(
                                                  'Compartir',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 15.0,
                                                ),
                                                tileColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                dense: false,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(12.0, 0.0,
                                                            12.0, 0.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      const Divider(
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
                                          await launchURL(
                                              'https://wa.me/5491153335069');
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.help_outline,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Ayuda y soporte',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Divider(
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
                                          context.pushNamed(
                                              'terminos_condiciones');
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.security,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Términos y condiciones',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Divider(
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
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: const SizedBox(
                                                    height: 300.0,
                                                    child:
                                                        DeleteAccountWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.delete_outline,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Eliminar cuenta',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Divider(
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
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: const SizedBox(
                                                    height: 200.0,
                                                    child: LogOutWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.logout,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Cerrar sesión',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (profileUsuariosRow.admin ?? true)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 15.0, 10.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().foto =
                                              profileUsuariosRow.foto!;
                                          FFAppState().fechaNacimiento =
                                              profileUsuariosRow
                                                  .fechaNacimiento;
                                          safeSetState(() {});

                                          context.pushNamed('editar_perfil');
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.person_outline_rounded,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Editar perfil',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Divider(
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
                                          context
                                              .pushNamed('alertas_de_servicio');
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.add_alert_outlined,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Alertas de servicio',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Divider(
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
                                          context.pushNamed('chatsAdmin');
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.chat_outlined,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Chats',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Divider(
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
                                          context.pushNamed('send_push');
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.notifications_outlined,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Notificaciones',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Divider(
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
                                          context.pushNamed('ajustes_globales');
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: const FaIcon(
                                              FontAwesomeIcons.globe,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Ajustes globales',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Divider(
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
                                            leading: const Icon(
                                              Icons.share,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Compartir',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      const Divider(
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
                                          context.pushNamed(
                                              'terminos_condiciones');
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.security,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Términos y condiciones',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Divider(
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
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: const SizedBox(
                                                    height: 300.0,
                                                    child:
                                                        DeleteAccountWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.delete_outline,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Eliminar cuenta',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Divider(
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
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: const SizedBox(
                                                    height: 200.0,
                                                    child: LogOutWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.logout,
                                              color: Color(0xFF1C2A3A),
                                            ),
                                            title: Text(
                                              'Cerrar sesión',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF6B7280),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 15.0,
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
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
                                decoration: const BoxDecoration(),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Version 1.0.11',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 0.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                              spreadRadius: 0.0,
                            )
                          ],
                        ),
                        child: wrapWithModel(
                          model: _model.navbarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavbarWidget(),
                        ),
                      ),
                    ],
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
