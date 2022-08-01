import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sample_get_fetch/bloc/event/public_policy_event.dart';
import 'package:sample_get_fetch/bloc/handle_api/public_policy_bloc.dart';
import 'package:sample_get_fetch/bloc/state/public_policy_state.dart';
import 'package:sample_get_fetch/model/public_policy.dart';

class RenderHtmlPage extends StatefulWidget {
  const RenderHtmlPage({Key? key}) : super(key: key);

  @override
  State<RenderHtmlPage> createState() => _RenderHtmlPageState();
}

class _RenderHtmlPageState extends State<RenderHtmlPage> {
  final PublicPolicyBloc _publicPolicyBloc = PublicPolicyBloc();

  @override
  void initState() {
    super.initState();
    _publicPolicyBloc.add(GetPublicPolicy());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: BlocConsumer<PublicPolicyBloc, PublicPolicyState>(
            bloc: _publicPolicyBloc,
            listener: (context, state) {
              print('state is $state');
              if (state is PublicPolicyError) {
                print(publicPolicyToJson(state.publicPolicy));
              }
            },
            builder: (context, state) {
              if (state is PublicPolicyLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PublicPolicySuccess) {
                return SingleChildScrollView(
                    child: Html(data: state.publicPolicy.data));
              } else if (state is PublicPolicyError) {
                return Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                      onPressed: () {
                        _publicPolicyBloc.add(GetPublicPolicy());
                      },
                      child: const Text('Reload')),
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}
