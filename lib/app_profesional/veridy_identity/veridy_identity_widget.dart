import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'veridy_identity_model.dart';
export 'veridy_identity_model.dart';

class VeridyIdentityWidget extends StatefulWidget {
  const VeridyIdentityWidget({super.key});

  @override
  State<VeridyIdentityWidget> createState() => _VeridyIdentityWidgetState();
}

class _VeridyIdentityWidgetState extends State<VeridyIdentityWidget> {
  late VeridyIdentityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VeridyIdentityModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        List<UsuariosRow> veridyIdentityUsuariosRowList = snapshot.data!;

        final veridyIdentityUsuariosRow =
            veridyIdentityUsuariosRowList.isNotEmpty
                ? veridyIdentityUsuariosRowList.first
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
              backgroundColor: const Color(0xFF3D64FF),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Verificación de identidad',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 600.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          15.0, 20.0, 15.0, 40.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Para brindarte acceso a todos los beneficios que tenemos para vos, necesitamos verificar tu identidad. Completá la información solicitada para comenzar a disfrutar de beneficios exclusivos como:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.check,
                                        color: Colors.green,
                                        size: 24.0,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Podrás realizar mas de 1 publicación',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.check,
                                        color: Colors.green,
                                        size: 24.0,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Tendrás el símbolo de perfil verificado',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.verified,
                                        color: Color(0xFF3E9AF0),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.check,
                                        color: Colors.green,
                                        size: 24.0,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Podrás compartir tu perfil por diferentes canales',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.check,
                                        color: Colors.green,
                                        size: 24.0,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Tendrás prioridad para recibir alertas de servicios',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.check,
                                        color: Colors.green,
                                        size: 24.0,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Podrás generar reputación en el sitio',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.check,
                                        color: Colors.green,
                                        size: 24.0,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Aparecerás en los destacados del sitio',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if ((veridyIdentityUsuariosRow?.dniFile !=
                                              null &&
                                          veridyIdentityUsuariosRow?.dniFile !=
                                              '') &&
                                      (veridyIdentityUsuariosRow
                                                  ?.dniFileDorso !=
                                              null &&
                                          veridyIdentityUsuariosRow
                                                  ?.dniFileDorso !=
                                              '')) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('DNI enviado'),
                                          content: const Text(
                                              'Ya has enviado la foto de tu DNI'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    context.pushNamed('subirfotoDNI');
                                  }
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      color:
                                          (veridyIdentityUsuariosRow?.dniFile !=
                                                          null &&
                                                      veridyIdentityUsuariosRow
                                                              ?.dniFile !=
                                                          '') &&
                                                  (veridyIdentityUsuariosRow
                                                              ?.dniFileDorso !=
                                                          null &&
                                                      veridyIdentityUsuariosRow
                                                              ?.dniFileDorso !=
                                                          '')
                                              ? Colors.green
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.idCard,
                                                color: (veridyIdentityUsuariosRow
                                                                    ?.dniFile !=
                                                                null &&
                                                            veridyIdentityUsuariosRow
                                                                    ?.dniFile !=
                                                                '') &&
                                                        (veridyIdentityUsuariosRow
                                                                    ?.dniFileDorso !=
                                                                null &&
                                                            veridyIdentityUsuariosRow
                                                                    ?.dniFileDorso !=
                                                                '')
                                                    ? Colors.white
                                                    : const Color(0xFF3D64FF),
                                                size: 40.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'DNI',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: (veridyIdentityUsuariosRow?.dniFile !=
                                                                            null &&
                                                                        veridyIdentityUsuariosRow?.dniFile !=
                                                                            '') &&
                                                                    (veridyIdentityUsuariosRow?.dniFileDorso !=
                                                                            null &&
                                                                        veridyIdentityUsuariosRow?.dniFileDorso !=
                                                                            '')
                                                                ? Colors.white
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if ((veridyIdentityUsuariosRow
                                                            ?.dniFile ==
                                                        null ||
                                                    veridyIdentityUsuariosRow
                                                            ?.dniFile ==
                                                        '') ||
                                                (veridyIdentityUsuariosRow
                                                            ?.dniFileDorso ==
                                                        null ||
                                                    veridyIdentityUsuariosRow
                                                            ?.dniFileDorso ==
                                                        ''))
                                              const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 30.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.angleRight,
                                                  color: Color(0xFF3D64FF),
                                                  size: 24.0,
                                                ),
                                              ),
                                            if ((veridyIdentityUsuariosRow
                                                            ?.dniFile !=
                                                        null &&
                                                    veridyIdentityUsuariosRow
                                                            ?.dniFile !=
                                                        '') &&
                                                (veridyIdentityUsuariosRow
                                                            ?.dniFile !=
                                                        null &&
                                                    veridyIdentityUsuariosRow
                                                            ?.dniFile !=
                                                        ''))
                                              const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 30.0, 0.0),
                                                child: Icon(
                                                  Icons.check_circle_sharp,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (veridyIdentityUsuariosRow
                                              ?.fotoPersonalFile !=
                                          null &&
                                      veridyIdentityUsuariosRow
                                              ?.fotoPersonalFile !=
                                          '') {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Foto enviada'),
                                          content: const Text(
                                              'Tu foto ya ha sido enviada'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    context.pushNamed('subirfotopersonal');
                                  }
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      color: veridyIdentityUsuariosRow
                                                      ?.fotoPersonalFile !=
                                                  null &&
                                              veridyIdentityUsuariosRow
                                                      ?.fotoPersonalFile !=
                                                  ''
                                          ? Colors.green
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: veridyIdentityUsuariosRow
                                                                ?.fotoPersonalFile !=
                                                            null &&
                                                        veridyIdentityUsuariosRow
                                                                ?.fotoPersonalFile !=
                                                            ''
                                                    ? Colors.white
                                                    : const Color(0xFF3D64FF),
                                                size: 40.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Foto personal',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: veridyIdentityUsuariosRow
                                                                            ?.fotoPersonalFile !=
                                                                        null &&
                                                                    veridyIdentityUsuariosRow
                                                                            ?.fotoPersonalFile !=
                                                                        ''
                                                                ? Colors.white
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (veridyIdentityUsuariosRow
                                                        ?.fotoPersonalFile ==
                                                    null ||
                                                veridyIdentityUsuariosRow
                                                        ?.fotoPersonalFile ==
                                                    '')
                                              const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 30.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.angleRight,
                                                  color: Color(0xFF3D64FF),
                                                  size: 24.0,
                                                ),
                                              ),
                                            if (veridyIdentityUsuariosRow
                                                        ?.fotoPersonalFile !=
                                                    null &&
                                                veridyIdentityUsuariosRow
                                                        ?.fotoPersonalFile !=
                                                    '')
                                              const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 30.0, 0.0),
                                                child: Icon(
                                                  Icons.check_circle_sharp,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
