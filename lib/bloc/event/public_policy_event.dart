import 'package:equatable/equatable.dart';

abstract class PublicPolicyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetPublicPolicy extends PublicPolicyEvent {}
