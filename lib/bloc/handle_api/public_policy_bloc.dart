import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_get_fetch/bloc/event/public_policy_event.dart';
import 'package:sample_get_fetch/bloc/state/public_policy_state.dart';
import 'package:sample_get_fetch/model/public_policy.dart';
import 'package:sample_get_fetch/service/api_service.dart';

class PublicPolicyBloc extends Bloc<PublicPolicyEvent, PublicPolicyState> {
  final APIService _apiService = APIService();
  PublicPolicyBloc() : super(PublicPolicyInit()) {
    on<GetPublicPolicy>((event, emit) async {
      emit(PublicPolicyLoading());
      try {
        final response = await _apiService.getPublicPolicy();
        if (response.statusCode == 200) {
          emit(PublicPolicySuccess(
              PublicPolicy.fromJson(jsonDecode(response.body))));
        } else {
          PublicPolicy e = PublicPolicy.fromJson(jsonDecode(response.body));
          emit(PublicPolicyError(
              PublicPolicy(status: false, message: e.message, data: '')));
        }
      } catch (e) {
        emit(PublicPolicyError(
            PublicPolicy(status: false, message: e.toString(), data: '')));
      }
    });
  }
}
