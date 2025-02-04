import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

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
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<UsuariosRow> containerUsuariosRowList = snapshot.data!;

        final containerUsuariosRow = containerUsuariosRowList.isNotEmpty
            ? containerUsuariosRowList.first
            : null;

        return Container(
          height: 80.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 10.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  -10.0,
                ),
                spreadRadius: 1.0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if ((FFAppState().modovendedor == false) &&
                  !containerUsuariosRow!.admin!)
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
                                context.goNamed(
                                  'Home',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: ('nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                              'nirby://nirby.com/home') ||
                                          ('nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                              'nirby://nirby.com/')
                                      ? const Color(0xFFD8E0FF)
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.home,
                                    color: ('nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                                'nirby://nirby.com/home') ||
                                            ('nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                                'nirby://nirby.com/')
                                        ? const Color(0xFF3D64FF)
                                        : const Color(0xFF4B5563),
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
                                context.goNamed(
                                  'chats',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color:
                                      'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                              'nirby://nirby.com/chats'
                                          ? const Color(0xFFD8E0FF)
                                          : FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.chat,
                                    color:
                                        'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                                'nirby://nirby.com/chats'
                                            ? const Color(0xFF3D64FF)
                                            : const Color(0xFF4B5563),
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
                                context.goNamed(
                                  'alertasDeServicioHistoria',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: 'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                          'nirby://nirby.com/alertasDeServicioHistoria'
                                      ? const Color(0xFFD8E0FF)
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.add_alert,
                                    color: 'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                            'nirby://nirby.com/alertasDeServicioHistoria'
                                        ? const Color(0xFF3D64FF)
                                        : const Color(0xFF4B5563),
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
                                FFAppState().foto = containerUsuariosRow.foto!;
                                safeSetState(() {});

                                context.goNamed(
                                  'profile',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color:
                                      'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                              'nirby://nirby.com/profile'
                                          ? const Color(0xFFD8E0FF)
                                          : FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.person_sharp,
                                    color:
                                        'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                                'nirby://nirby.com/profile'
                                            ? const Color(0xFF3D64FF)
                                            : const Color(0xFF4B5563),
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
              if (containerUsuariosRow?.admin ?? true)
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
                                context.goNamed(
                                  'profile',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color:
                                      'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                              'nirby://nirby.com/profile'
                                          ? const Color(0xFFD8E0FF)
                                          : FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.settings_sharp,
                                    color:
                                        'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                                'nirby://nirby.com/profile'
                                            ? const Color(0xFF3D64FF)
                                            : const Color(0xFF4B5563),
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
                                context.goNamed(
                                  'Home',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: ('nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                              'nirby://nirby.com/home') ||
                                          ('nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                              'nirby://nirby.com/')
                                      ? const Color(0xFFD8E0FF)
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.home,
                                    color: ('nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                                'nirby://nirby.com/home') ||
                                            ('nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                                'nirby://nirby.com/')
                                        ? const Color(0xFF3D64FF)
                                        : const Color(0xFF4B5563),
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
                                context.goNamed(
                                  'users',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color:
                                      'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                              'nirby://nirby.com/users'
                                          ? const Color(0xFFD8E0FF)
                                          : FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.person_search_rounded,
                                    color:
                                        'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                                'nirby://nirby.com/users'
                                            ? const Color(0xFF3D64FF)
                                            : const Color(0xFF4B5563),
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
              if ((FFAppState().modovendedor == true) &&
                  !containerUsuariosRow!.admin!)
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
                                context.goNamed(
                                  'Home',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: ('nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                              'nirby://nirby.com/home') ||
                                          ('nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                              'nirby://nirby.com/')
                                      ? const Color(0xFFD8E0FF)
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.home,
                                    color: ('nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                                'nirby://nirby.com/home') ||
                                            ('nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                                'nirby://nirby.com/')
                                        ? const Color(0xFF3D64FF)
                                        : const Color(0xFF4B5563),
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
                                context.goNamed(
                                  'chats',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color:
                                      'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                              'nirby://nirby.com/chats'
                                          ? const Color(0xFFD8E0FF)
                                          : FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.chat,
                                    color:
                                        'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                                'nirby://nirby.com/chats'
                                            ? const Color(0xFF3D64FF)
                                            : const Color(0xFF4B5563),
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
                                FFAppState().foto = containerUsuariosRow.foto!;
                                safeSetState(() {});

                                context.goNamed(
                                  'serviciosList',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: 'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                          'nirby://nirby.com/serviciosprofesional'
                                      ? const Color(0xFFD8E0FF)
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.list,
                                    color: 'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                            'nirby://nirby.com/serviciosprofesional'
                                        ? const Color(0xFF3D64FF)
                                        : const Color(0xFF4B5563),
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
                                FFAppState().foto = containerUsuariosRow.foto!;
                                safeSetState(() {});

                                context.goNamed(
                                  'profile',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color:
                                      'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                              'nirby://nirby.com/profile'
                                          ? const Color(0xFFD8E0FF)
                                          : FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.person_sharp,
                                    color:
                                        'nirby://nirby.com${GoRouterState.of(context).uri.toString()}' ==
                                                'nirby://nirby.com/profile'
                                            ? const Color(0xFF3D64FF)
                                            : const Color(0xFF4B5563),
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
      },
    );
  }
}
