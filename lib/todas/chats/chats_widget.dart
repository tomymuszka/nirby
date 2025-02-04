import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/empty_lists/empty_list_chats_client/empty_list_chats_client_widget.dart';
import '/empty_lists/empty_list_chats_seller/empty_list_chats_seller_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/todas/navbar/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chats_model.dart';
export 'chats_model.dart';

class ChatsWidget extends StatefulWidget {
  const ChatsWidget({super.key});

  @override
  State<ChatsWidget> createState() => _ChatsWidgetState();
}

class _ChatsWidgetState extends State<ChatsWidget>
    with TickerProviderStateMixin {
  late ChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 600.0,
              ),
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 25.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Chats',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter Tight',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter Tight',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            tabs: const [
                              Tab(
                                text: 'De Servicios',
                              ),
                              Tab(
                                text: 'De Alertas',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        if (FFAppState().modovendedor) {
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 15.0, 0.0),
                                            child: FutureBuilder<
                                                List<ConversationDetailsRow>>(
                                              future: ConversationDetailsTable()
                                                  .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'seller_id',
                                                      currentUserUid,
                                                    )
                                                    .order('last_message_time'),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ConversationDetailsRow>
                                                    listViewConversationDetailsRowList =
                                                    snapshot.data!;

                                                if (listViewConversationDetailsRowList
                                                    .isEmpty) {
                                                  return const EmptyListChatsSellerWidget();
                                                }

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewConversationDetailsRowList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewConversationDetailsRow =
                                                        listViewConversationDetailsRowList[
                                                            listViewIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'chatService',
                                                            queryParameters: {
                                                              'conversationId':
                                                                  serializeParam(
                                                                listViewConversationDetailsRow
                                                                    .conversationId,
                                                                ParamType.int,
                                                              ),
                                                              'recipentId':
                                                                  serializeParam(
                                                                listViewConversationDetailsRow
                                                                    .buyerId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'serviceId':
                                                                  serializeParam(
                                                                listViewConversationDetailsRow
                                                                    .serviceId,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 4.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 160.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            5.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (listViewConversationDetailsRow.buyerFoto !=
                                                                                null &&
                                                                            listViewConversationDetailsRow.buyerFoto !=
                                                                                '')
                                                                          Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              listViewConversationDetailsRow.buyerFoto!,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        Expanded(
                                                                          flex:
                                                                              3,
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                          child: Text(
                                                                                            '${listViewConversationDetailsRow.buyerNombre} ${listViewConversationDetailsRow.buyerApellido}',
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      if (listViewConversationDetailsRow.lastMessageTime != null)
                                                                                        Flexible(
                                                                                          child: Text(
                                                                                            dateTimeFormat(
                                                                                              "relative",
                                                                                              listViewConversationDetailsRow.lastMessageTime!,
                                                                                              locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            listViewConversationDetailsRow.lastMessage,
                                                                                            'last mess',
                                                                                          ),
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: const Color(0xFF9CA3AF),
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  height: 3.0,
                                                                  thickness:
                                                                      1.0,
                                                                  indent: 20.0,
                                                                  endIndent:
                                                                      20.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              listViewConversationDetailsRow.serviceTitle,
                                                                              'Título',
                                                                            ),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter Tight',
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
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
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 15.0, 0.0),
                                            child: FutureBuilder<
                                                List<ConversationDetailsRow>>(
                                              future: ConversationDetailsTable()
                                                  .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'buyer_id',
                                                      currentUserUid,
                                                    )
                                                    .order('last_message_time'),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ConversationDetailsRow>
                                                    listViewConversationDetailsRowList =
                                                    snapshot.data!;

                                                if (listViewConversationDetailsRowList
                                                    .isEmpty) {
                                                  return const EmptyListChatsClientWidget();
                                                }

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewConversationDetailsRowList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewConversationDetailsRow =
                                                        listViewConversationDetailsRowList[
                                                            listViewIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'chatService',
                                                            queryParameters: {
                                                              'conversationId':
                                                                  serializeParam(
                                                                listViewConversationDetailsRow
                                                                    .conversationId,
                                                                ParamType.int,
                                                              ),
                                                              'recipentId':
                                                                  serializeParam(
                                                                listViewConversationDetailsRow
                                                                    .sellerId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'serviceId':
                                                                  serializeParam(
                                                                listViewConversationDetailsRow
                                                                    .serviceId,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 4.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 160.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            5.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (listViewConversationDetailsRow.sellerFoto !=
                                                                                null &&
                                                                            listViewConversationDetailsRow.sellerFoto !=
                                                                                '')
                                                                          Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              listViewConversationDetailsRow.sellerFoto!,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        Expanded(
                                                                          flex:
                                                                              3,
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                          child: Text(
                                                                                            '${listViewConversationDetailsRow.sellerNombre} ${listViewConversationDetailsRow.sellerApellido}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        dateTimeFormat(
                                                                                          "relative",
                                                                                          listViewConversationDetailsRow.lastMessageTime!,
                                                                                          locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            listViewConversationDetailsRow.lastMessage,
                                                                                            'last mess',
                                                                                          ),
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: const Color(0xFF9CA3AF),
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  height: 3.0,
                                                                  thickness:
                                                                      1.0,
                                                                  indent: 20.0,
                                                                  endIndent:
                                                                      20.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              listViewConversationDetailsRow.serviceTitle,
                                                                              'Titulo',
                                                                            ),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter Tight',
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
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
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        if (FFAppState().modovendedor) {
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 15.0, 0.0),
                                            child: FutureBuilder<
                                                List<
                                                    AlertConversationDetailsRow>>(
                                              future:
                                                  AlertConversationDetailsTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'seller_id',
                                                      currentUserUid,
                                                    )
                                                    .order('last_message_time'),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<AlertConversationDetailsRow>
                                                    listViewAlertConversationDetailsRowList =
                                                    snapshot.data!;

                                                if (listViewAlertConversationDetailsRowList
                                                    .isEmpty) {
                                                  return const EmptyListChatsSellerWidget();
                                                }

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewAlertConversationDetailsRowList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewAlertConversationDetailsRow =
                                                        listViewAlertConversationDetailsRowList[
                                                            listViewIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'chatAlerta',
                                                            queryParameters: {
                                                              'conversationId':
                                                                  serializeParam(
                                                                listViewAlertConversationDetailsRow
                                                                    .conversationId,
                                                                ParamType.int,
                                                              ),
                                                              'recipentId':
                                                                  serializeParam(
                                                                listViewAlertConversationDetailsRow
                                                                    .buyerId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'alertaId':
                                                                  serializeParam(
                                                                listViewAlertConversationDetailsRow
                                                                    .alertaDeServicio,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 4.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 160.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            5.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (listViewAlertConversationDetailsRow.buyerFoto !=
                                                                                null &&
                                                                            listViewAlertConversationDetailsRow.buyerFoto !=
                                                                                '')
                                                                          Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              listViewAlertConversationDetailsRow.buyerFoto!,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        Expanded(
                                                                          flex:
                                                                              3,
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                          child: Text(
                                                                                            '${listViewAlertConversationDetailsRow.buyerNombre} ${listViewAlertConversationDetailsRow.buyerApellido}',
                                                                                            maxLines: 2,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      if (listViewAlertConversationDetailsRow.lastMessageTime != null)
                                                                                        Flexible(
                                                                                          child: Text(
                                                                                            dateTimeFormat(
                                                                                              "relative",
                                                                                              listViewAlertConversationDetailsRow.lastMessageTime!,
                                                                                              locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            listViewAlertConversationDetailsRow.lastMessage,
                                                                                            'last mess',
                                                                                          ),
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: const Color(0xFF9CA3AF),
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  height: 3.0,
                                                                  thickness:
                                                                      1.0,
                                                                  indent: 20.0,
                                                                  endIndent:
                                                                      20.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              listViewAlertConversationDetailsRow.alertaDescription,
                                                                              'Título',
                                                                            ),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter Tight',
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
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
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 15.0, 0.0),
                                            child: FutureBuilder<
                                                List<
                                                    AlertConversationDetailsRow>>(
                                              future:
                                                  AlertConversationDetailsTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'buyer_id',
                                                      currentUserUid,
                                                    )
                                                    .neqOrNull(
                                                      'last_message',
                                                      null,
                                                    )
                                                    .order('last_message_time'),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<AlertConversationDetailsRow>
                                                    listViewAlertConversationDetailsRowList =
                                                    snapshot.data!;

                                                if (listViewAlertConversationDetailsRowList
                                                    .isEmpty) {
                                                  return const EmptyListChatsClientWidget();
                                                }

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewAlertConversationDetailsRowList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewAlertConversationDetailsRow =
                                                        listViewAlertConversationDetailsRowList[
                                                            listViewIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'chatAlerta',
                                                            queryParameters: {
                                                              'conversationId':
                                                                  serializeParam(
                                                                listViewAlertConversationDetailsRow
                                                                    .conversationId,
                                                                ParamType.int,
                                                              ),
                                                              'recipentId':
                                                                  serializeParam(
                                                                listViewAlertConversationDetailsRow
                                                                    .sellerId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'alertaId':
                                                                  serializeParam(
                                                                listViewAlertConversationDetailsRow
                                                                    .alertaDeServicio,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 4.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 160.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            5.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (listViewAlertConversationDetailsRow.sellerFoto !=
                                                                                null &&
                                                                            listViewAlertConversationDetailsRow.sellerFoto !=
                                                                                '')
                                                                          Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              listViewAlertConversationDetailsRow.sellerFoto!,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        Expanded(
                                                                          flex:
                                                                              3,
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Flexible(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                          child: Text(
                                                                                            '${listViewAlertConversationDetailsRow.sellerNombre} ${listViewAlertConversationDetailsRow.sellerApellido}',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        dateTimeFormat(
                                                                                          "relative",
                                                                                          listViewAlertConversationDetailsRow.lastMessageTime!,
                                                                                          locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            listViewAlertConversationDetailsRow.lastMessage,
                                                                                            'last mess',
                                                                                          ),
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: const Color(0xFF9CA3AF),
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  height: 3.0,
                                                                  thickness:
                                                                      1.0,
                                                                  indent: 20.0,
                                                                  endIndent:
                                                                      20.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Flexible(
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              listViewAlertConversationDetailsRow.alertaDescription,
                                                                              'Titulo',
                                                                            ),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter Tight',
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
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
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
  }
}
