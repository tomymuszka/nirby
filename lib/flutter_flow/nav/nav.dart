import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

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
          appStateNotifier.loggedIn ? HomeWidget() : Onboarding01Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : Onboarding01Widget(),
        ),
        FFRoute(
          name: Signin1Widget.routeName,
          path: Signin1Widget.routePath,
          builder: (context, params) => Signin1Widget(),
        ),
        FFRoute(
          name: ServiciosWidget.routeName,
          path: ServiciosWidget.routePath,
          builder: (context, params) => ServiciosWidget(
            categoriaid: params.getParam(
              'categoriaid',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ServicioDetalleWidget.routeName,
          path: ServicioDetalleWidget.routePath,
          builder: (context, params) => ServicioDetalleWidget(
            service: params.getParam(
              'service',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ChatServiceWidget.routeName,
          path: ChatServiceWidget.routePath,
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
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: SigninWidget.routeName,
          path: SigninWidget.routePath,
          builder: (context, params) => SigninWidget(),
        ),
        FFRoute(
          name: OlvidastecontrasenaWidget.routeName,
          path: OlvidastecontrasenaWidget.routePath,
          builder: (context, params) => OlvidastecontrasenaWidget(),
        ),
        FFRoute(
          name: ReviewsCompleteWidget.routeName,
          path: ReviewsCompleteWidget.routePath,
          builder: (context, params) => ReviewsCompleteWidget(
            profesionalId: params.getParam(
              'profesionalId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EditarPerfilWidget.routeName,
          path: EditarPerfilWidget.routePath,
          builder: (context, params) => EditarPerfilWidget(),
        ),
        FFRoute(
          name: NotificationWidget.routeName,
          path: NotificationWidget.routePath,
          builder: (context, params) => NotificationWidget(),
        ),
        FFRoute(
          name: Onboarding01Widget.routeName,
          path: Onboarding01Widget.routePath,
          builder: (context, params) => Onboarding01Widget(),
        ),
        FFRoute(
          name: Onboarding02Widget.routeName,
          path: Onboarding02Widget.routePath,
          builder: (context, params) => Onboarding02Widget(),
        ),
        FFRoute(
          name: CrearservicioWidget.routeName,
          path: CrearservicioWidget.routePath,
          builder: (context, params) => CrearservicioWidget(),
        ),
        FFRoute(
          name: CompleteprofileWidget.routeName,
          path: CompleteprofileWidget.routePath,
          builder: (context, params) => CompleteprofileWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: VeridyIdentityWidget.routeName,
          path: VeridyIdentityWidget.routePath,
          builder: (context, params) => VeridyIdentityWidget(),
        ),
        FFRoute(
          name: SubirfotopersonalWidget.routeName,
          path: SubirfotopersonalWidget.routePath,
          builder: (context, params) => SubirfotopersonalWidget(),
        ),
        FFRoute(
          name: SubirfotoDNIWidget.routeName,
          path: SubirfotoDNIWidget.routePath,
          builder: (context, params) => SubirfotoDNIWidget(),
        ),
        FFRoute(
          name: CrearAlertaDeServicioWidget.routeName,
          path: CrearAlertaDeServicioWidget.routePath,
          builder: (context, params) => CrearAlertaDeServicioWidget(),
        ),
        FFRoute(
          name: PaymentWidget.routeName,
          path: PaymentWidget.routePath,
          builder: (context, params) => PaymentWidget(),
        ),
        FFRoute(
          name: EditarservicioWidget.routeName,
          path: EditarservicioWidget.routePath,
          builder: (context, params) => EditarservicioWidget(
            idservicio: params.getParam(
              'idservicio',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: TerminosCondicionesWidget.routeName,
          path: TerminosCondicionesWidget.routePath,
          builder: (context, params) => TerminosCondicionesWidget(),
        ),
        FFRoute(
          name: DetalleAlertaServicioWidget.routeName,
          path: DetalleAlertaServicioWidget.routePath,
          builder: (context, params) => DetalleAlertaServicioWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: EditarAlertaDeServicioWidget.routeName,
          path: EditarAlertaDeServicioWidget.routePath,
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
          name: AlertasDeServicioProfesionalesWidget.routeName,
          path: AlertasDeServicioProfesionalesWidget.routePath,
          builder: (context, params) => AlertasDeServicioProfesionalesWidget(
            idalerta: params.getParam(
              'idalerta',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: DetalleProfesionalWidget.routeName,
          path: DetalleProfesionalWidget.routePath,
          builder: (context, params) => DetalleProfesionalWidget(
            profesional: params.getParam(
              'profesional',
              ParamType.String,
            ),
            usuarioalertaid: params.getParam(
              'usuarioalertaid',
              ParamType.int,
            ),
            alertaid: params.getParam(
              'alertaid',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ChatAlertaWidget.routeName,
          path: ChatAlertaWidget.routePath,
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
          name: CategoriasProfesionalWidget.routeName,
          path: CategoriasProfesionalWidget.routePath,
          builder: (context, params) => CategoriasProfesionalWidget(),
        ),
        FFRoute(
          name: VerifyinprocessWidget.routeName,
          path: VerifyinprocessWidget.routePath,
          builder: (context, params) => VerifyinprocessWidget(),
        ),
        FFRoute(
          name: UsersWidget.routeName,
          path: UsersWidget.routePath,
          builder: (context, params) => UsersWidget(),
        ),
        FFRoute(
          name: DetalleUsuarioAdminWidget.routeName,
          path: DetalleUsuarioAdminWidget.routePath,
          builder: (context, params) => DetalleUsuarioAdminWidget(
            userId: params.getParam(
              'userId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DocumentosWidget.routeName,
          path: DocumentosWidget.routePath,
          builder: (context, params) => DocumentosWidget(
            userid: params.getParam(
              'userid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AjustesGlobalesWidget.routeName,
          path: AjustesGlobalesWidget.routePath,
          builder: (context, params) => AjustesGlobalesWidget(),
        ),
        FFRoute(
          name: AlertasDeServicioWidget.routeName,
          path: AlertasDeServicioWidget.routePath,
          builder: (context, params) => AlertasDeServicioWidget(),
        ),
        FFRoute(
          name: DetalleAlertaServicioAdminWidget.routeName,
          path: DetalleAlertaServicioAdminWidget.routePath,
          builder: (context, params) => DetalleAlertaServicioAdminWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ChatsAdminWidget.routeName,
          path: ChatsAdminWidget.routePath,
          builder: (context, params) => ChatsAdminWidget(),
        ),
        FFRoute(
          name: ChatAlertaAdminWidget.routeName,
          path: ChatAlertaAdminWidget.routePath,
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
          name: ChatServiceAdminWidget.routeName,
          path: ChatServiceAdminWidget.routePath,
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
          name: ActiveSuscriptionWidget.routeName,
          path: ActiveSuscriptionWidget.routePath,
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
          name: SendPushWidget.routeName,
          path: SendPushWidget.routePath,
          builder: (context, params) => SendPushWidget(),
        ),
        FFRoute(
          name: NotificacionesadminWidget.routeName,
          path: NotificacionesadminWidget.routePath,
          builder: (context, params) => NotificacionesadminWidget(),
        ),
        FFRoute(
          name: PasswordresetWidget.routeName,
          path: PasswordresetWidget.routePath,
          builder: (context, params) => PasswordresetWidget(),
        ),
        FFRoute(
          name: CongratsWidget.routeName,
          path: CongratsWidget.routePath,
          builder: (context, params) => CongratsWidget(),
        ),
        FFRoute(
          name: EmailpasswordsentWidget.routeName,
          path: EmailpasswordsentWidget.routePath,
          builder: (context, params) => EmailpasswordsentWidget(),
        ),
        FFRoute(
          name: HomeScreenWidget.routeName,
          path: HomeScreenWidget.routePath,
          builder: (context, params) => HomeScreenWidget(),
        ),
        FFRoute(
          name: ServiciosScreenWidget.routeName,
          path: ServiciosScreenWidget.routePath,
          builder: (context, params) => ServiciosScreenWidget(
            categoriaid: params.getParam(
              'categoriaid',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: DetalleProfesionalScreenWidget.routeName,
          path: DetalleProfesionalScreenWidget.routePath,
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
          name: ServicioDetalleScreenWidget.routeName,
          path: ServicioDetalleScreenWidget.routePath,
          builder: (context, params) => ServicioDetalleScreenWidget(
            service: params.getParam(
              'service',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ChatServiceScreenWidget.routeName,
          path: ChatServiceScreenWidget.routePath,
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
          name: CrearAlertaDeServicioScreenWidget.routeName,
          path: CrearAlertaDeServicioScreenWidget.routePath,
          builder: (context, params) => CrearAlertaDeServicioScreenWidget(),
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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
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
