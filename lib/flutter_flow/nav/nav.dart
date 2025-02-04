import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomeWidget() : const Onboarding01Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const HomeWidget() : const Onboarding01Widget(),
        ),
        FFRoute(
          name: 'signin1',
          path: '/signin1',
          builder: (context, params) => const Signin1Widget(),
        ),
        FFRoute(
          name: 'servicios',
          path: '/servicios',
          builder: (context, params) => ServiciosWidget(
            categoriaid: params.getParam(
              'categoriaid',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'servicio_detalle',
          path: '/servicioDetalle',
          builder: (context, params) => ServicioDetalleWidget(
            service: params.getParam(
              'service',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, params) => const ProfileWidget(),
        ),
        FFRoute(
          name: 'chatService',
          path: '/chatService',
          builder: (context, params) => ChatServiceWidget(
            conversationId: params.getParam(
              'conversationId',
              ParamType.int,
            ),
            recipentId: params.getParam(
              'recipentId',
              ParamType.String,
            ),
            serviceId: params.getParam(
              'serviceId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'chats',
          path: '/chats',
          builder: (context, params) => const ChatsWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'signin',
          path: '/signin',
          builder: (context, params) => const SigninWidget(),
        ),
        FFRoute(
          name: 'olvidastecontrasena',
          path: '/olvidastecontrasena',
          builder: (context, params) => const OlvidastecontrasenaWidget(),
        ),
        FFRoute(
          name: 'reviews_complete',
          path: '/reviewsComplete',
          builder: (context, params) => ReviewsCompleteWidget(
            profesionalId: params.getParam(
              'profesionalId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'editar_perfil',
          path: '/editarPerfil',
          builder: (context, params) => const EditarPerfilWidget(),
        ),
        FFRoute(
          name: 'notification',
          path: '/notification',
          builder: (context, params) => const NotificationWidget(),
        ),
        FFRoute(
          name: 'Onboarding01',
          path: '/onboarding01',
          builder: (context, params) => const Onboarding01Widget(),
        ),
        FFRoute(
          name: 'Onboarding02',
          path: '/onboarding02',
          builder: (context, params) => const Onboarding02Widget(),
        ),
        FFRoute(
          name: 'serviciosList',
          path: '/serviciosprofesional',
          builder: (context, params) => const ServiciosListWidget(),
        ),
        FFRoute(
          name: 'crearservicio',
          path: '/crearservicio',
          builder: (context, params) => const CrearservicioWidget(),
        ),
        FFRoute(
          name: 'informacioprofesional',
          path: '/informacioprofesional',
          builder: (context, params) => const InformacioprofesionalWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          builder: (context, params) => const HomeWidget(),
        ),
        FFRoute(
          name: 'veridyIdentity',
          path: '/veridyIdentity',
          builder: (context, params) => const VeridyIdentityWidget(),
        ),
        FFRoute(
          name: 'subirfotopersonal',
          path: '/subirfotopersonal',
          builder: (context, params) => const SubirfotopersonalWidget(),
        ),
        FFRoute(
          name: 'subirfotoDNI',
          path: '/subirfotoDNI',
          builder: (context, params) => const SubirfotoDNIWidget(),
        ),
        FFRoute(
          name: 'crearAlertaDeServicio',
          path: '/crearAlertaDeServicio',
          builder: (context, params) => const CrearAlertaDeServicioWidget(),
        ),
        FFRoute(
          name: 'payment',
          path: '/payment',
          builder: (context, params) => const PaymentWidget(),
        ),
        FFRoute(
          name: 'editarservicio',
          path: '/editarservicio',
          builder: (context, params) => EditarservicioWidget(
            idservicio: params.getParam(
              'idservicio',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'terminos_condiciones',
          path: '/terminosCondiciones',
          builder: (context, params) => const TerminosCondicionesWidget(),
        ),
        FFRoute(
          name: 'detalleAlertaServicio',
          path: '/detalleAlertaServicio',
          builder: (context, params) => DetalleAlertaServicioWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'editarAlertaDeServicio',
          path: '/editarAlertaDeServicio',
          builder: (context, params) => EditarAlertaDeServicioWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
            contadorinicial: params.getParam(
              'contadorinicial',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'alertasDeServicioProfesionales',
          path: '/alertasDeServicioProfesionales',
          builder: (context, params) => AlertasDeServicioProfesionalesWidget(
            idalerta: params.getParam(
              'idalerta',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'detalle_profesional',
          path: '/detalleProfesional',
          builder: (context, params) => DetalleProfesionalWidget(
            profesional: params.getParam(
              'profesional',
              ParamType.String,
            ),
            usuarioalertaid: params.getParam(
              'usuarioalertaid',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'alertasDeServicioHistoria',
          path: '/alertasDeServicioHistoria',
          builder: (context, params) => const AlertasDeServicioHistoriaWidget(),
        ),
        FFRoute(
          name: 'chatAlerta',
          path: '/chatAlerta',
          builder: (context, params) => ChatAlertaWidget(
            conversationId: params.getParam(
              'conversationId',
              ParamType.int,
            ),
            recipentId: params.getParam(
              'recipentId',
              ParamType.String,
            ),
            alertaId: params.getParam(
              'alertaId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'categorias_profesional',
          path: '/categoriasProfesional',
          builder: (context, params) => const CategoriasProfesionalWidget(),
        ),
        FFRoute(
          name: 'verifyinprocess',
          path: '/verifyinprocess',
          builder: (context, params) => const VerifyinprocessWidget(),
        ),
        FFRoute(
          name: 'users',
          path: '/users',
          builder: (context, params) => const UsersWidget(),
        ),
        FFRoute(
          name: 'DetalleUsuarioAdmin',
          path: '/detalleUsuarioAdmin',
          builder: (context, params) => DetalleUsuarioAdminWidget(
            userId: params.getParam(
              'userId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Documentos',
          path: '/documentos',
          builder: (context, params) => DocumentosWidget(
            userid: params.getParam(
              'userid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ajustes_globales',
          path: '/ajustesGlobales',
          builder: (context, params) => const AjustesGlobalesWidget(),
        ),
        FFRoute(
          name: 'alertas_de_servicio',
          path: '/alertasDeServicio',
          builder: (context, params) => const AlertasDeServicioWidget(),
        ),
        FFRoute(
          name: 'detalleAlertaServicioAdmin',
          path: '/detalleAlertaServicioAdmin',
          builder: (context, params) => DetalleAlertaServicioAdminWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'chatsAdmin',
          path: '/chatsAdmin',
          builder: (context, params) => const ChatsAdminWidget(),
        ),
        FFRoute(
          name: 'chatAlertaAdmin',
          path: '/chatAlertaAdmin',
          builder: (context, params) => ChatAlertaAdminWidget(
            conversationId: params.getParam(
              'conversationId',
              ParamType.int,
            ),
            recipentId: params.getParam(
              'recipentId',
              ParamType.String,
            ),
            alertaId: params.getParam(
              'alertaId',
              ParamType.int,
            ),
            senderid: params.getParam(
              'senderid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'chatServiceAdmin',
          path: '/chatServiceAdmin',
          builder: (context, params) => ChatServiceAdminWidget(
            conversationId: params.getParam(
              'conversationId',
              ParamType.int,
            ),
            recipentId: params.getParam(
              'recipentId',
              ParamType.String,
            ),
            serviceId: params.getParam(
              'serviceId',
              ParamType.int,
            ),
            senderid: params.getParam(
              'senderid',
              ParamType.String,
            ),
            buyername: params.getParam(
              'buyername',
              ParamType.String,
            ),
            buyerlastname: params.getParam(
              'buyerlastname',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'active_suscription',
          path: '/activeSuscription',
          builder: (context, params) => ActiveSuscriptionWidget(
            amount: params.getParam(
              'amount',
              ParamType.double,
            ),
            fechafacturacion: params.getParam(
              'fechafacturacion',
              ParamType.String,
            ),
            frecuencia: params.getParam(
              'frecuencia',
              ParamType.int,
            ),
            idsuscripcion: params.getParam(
              'idsuscripcion',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'send_push',
          path: '/sendPush',
          builder: (context, params) => const SendPushWidget(),
        ),
        FFRoute(
          name: 'notificacionesadmin',
          path: '/notificacionesadmin',
          builder: (context, params) => const NotificacionesadminWidget(),
        ),
        FFRoute(
          name: 'passwordreset',
          path: '/passwordreset',
          builder: (context, params) => const PasswordresetWidget(),
        ),
        FFRoute(
          name: 'congrats',
          path: '/congrats',
          builder: (context, params) => const CongratsWidget(),
        ),
        FFRoute(
          name: 'emailpasswordsent',
          path: '/emailpasswordsent',
          builder: (context, params) => const EmailpasswordsentWidget(),
        ),
        FFRoute(
          name: 'HomeScreen',
          path: '/homeScreen',
          builder: (context, params) => const HomeScreenWidget(),
        ),
        FFRoute(
          name: 'serviciosScreen',
          path: '/serviciosScreen',
          builder: (context, params) => ServiciosScreenWidget(
            categoriaid: params.getParam(
              'categoriaid',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'detalle_profesionalScreen',
          path: '/detalleProfesionalScreen',
          builder: (context, params) => DetalleProfesionalScreenWidget(
            profesional: params.getParam(
              'profesional',
              ParamType.String,
            ),
            usuarioalertaid: params.getParam(
              'usuarioalertaid',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'servicio_detalleScreen',
          path: '/servicioDetalleScreen',
          builder: (context, params) => ServicioDetalleScreenWidget(
            service: params.getParam(
              'service',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'chatServiceScreen',
          path: '/chatServiceScreen',
          builder: (context, params) => ChatServiceScreenWidget(
            conversationId: params.getParam(
              'conversationId',
              ParamType.int,
            ),
            recipentId: params.getParam(
              'recipentId',
              ParamType.String,
            ),
            serviceId: params.getParam(
              'serviceId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'crearAlertaDeServicioScreen',
          path: '/crearAlertaDeServicioScreen',
          builder: (context, params) => const CrearAlertaDeServicioScreenWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding01';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/Diseo_sin_ttulo__1_-removebg-preview.png',
                        fit: BoxFit.contain,
                      ),
                    )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
