import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    required this.admin,
    required this.photo,
    this.numbermessages,
  });

  final bool? admin;
  final String? photo;
  final int? numbermessages;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());

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

    return Container(
      height: 80.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 2.0,
            decoration: BoxDecoration(
              color: Color(0x33000000),
            ),
          ),
          if (!widget.admin!)
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().PaginaSeleccionada = 'Home';
                            FFAppState().update(() {});
                          },
                          child: Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: FFAppState().PaginaSeleccionada == 'Home'
                                  ? Color(0xFFD8E0FF)
                                  : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.home,
                                color: FFAppState().PaginaSeleccionada == 'Home'
                                    ? Color(0xFF3D64FF)
                                    : Color(0xFF4B5563),
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().PaginaSeleccionada = 'Chats';
                            FFAppState().update(() {});
                          },
                          child: Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: FFAppState().PaginaSeleccionada == 'Chats'
                                  ? Color(0xFFD8E0FF)
                                  : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: badges.Badge(
                              badgeContent: Text(
                                valueOrDefault<String>(
                                  widget.numbermessages.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              showBadge: (widget.numbermessages != 0) &&
                                  (widget.numbermessages != null),
                              shape: badges.BadgeShape.circle,
                              badgeColor: Color(0xFFFF1F5B),
                              elevation: 4.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              position: badges.BadgePosition.topEnd(),
                              animationType: badges.BadgeAnimationType.scale,
                              toAnimate: true,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.chat,
                                  color:
                                      FFAppState().PaginaSeleccionada == 'Chats'
                                          ? Color(0xFF3D64FF)
                                          : Color(0xFF4B5563),
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!FFAppState().modovendedor)
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().PaginaSeleccionada = 'Alertas';
                              FFAppState().update(() {});
                            },
                            child: Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color:
                                    FFAppState().PaginaSeleccionada == 'Alertas'
                                        ? Color(0xFFD8E0FF)
                                        : FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.add_alert,
                                  color: FFAppState().PaginaSeleccionada ==
                                          'Alertas'
                                      ? Color(0xFF3D64FF)
                                      : Color(0xFF4B5563),
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (FFAppState().modovendedor)
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().PaginaSeleccionada = 'Servicios';
                              FFAppState().update(() {});
                            },
                            child: Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FFAppState().PaginaSeleccionada ==
                                        'Servicios'
                                    ? Color(0xFFD8E0FF)
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.list,
                                  color: FFAppState().PaginaSeleccionada ==
                                          'Servicios'
                                      ? Color(0xFF3D64FF)
                                      : Color(0xFF4B5563),
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().foto = widget.photo!;
                            FFAppState().PaginaSeleccionada = 'Profile';
                            FFAppState().update(() {});
                          },
                          child: Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color:
                                  FFAppState().PaginaSeleccionada == 'Profile'
                                      ? Color(0xFFD8E0FF)
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.person_sharp,
                                color:
                                    FFAppState().PaginaSeleccionada == 'Profile'
                                        ? Color(0xFF3D64FF)
                                        : Color(0xFF4B5563),
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (widget.admin ?? true)
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().PaginaSeleccionada = 'Profile';
                            FFAppState().update(() {});
                          },
                          child: Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color:
                                  FFAppState().PaginaSeleccionada == 'Profile'
                                      ? Color(0xFFD8E0FF)
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.settings_sharp,
                                color:
                                    FFAppState().PaginaSeleccionada == 'Profile'
                                        ? Color(0xFF3D64FF)
                                        : Color(0xFF4B5563),
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().PaginaSeleccionada = 'Home';
                            FFAppState().update(() {});
                          },
                          child: Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: FFAppState().PaginaSeleccionada == 'Home'
                                  ? Color(0xFFD8E0FF)
                                  : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.home,
                                color: FFAppState().PaginaSeleccionada == 'Home'
                                    ? Color(0xFF3D64FF)
                                    : Color(0xFF4B5563),
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().PaginaSeleccionada = 'Usuarios';
                            FFAppState().update(() {});
                          },
                          child: Container(
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color:
                                  FFAppState().PaginaSeleccionada == 'Usuarios'
                                      ? Color(0xFFD8E0FF)
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.person_search_rounded,
                                color: FFAppState().PaginaSeleccionada ==
                                        'Usuarios'
                                    ? Color(0xFF3D64FF)
                                    : Color(0xFF4B5563),
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
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
