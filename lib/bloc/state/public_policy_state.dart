import 'package:equatable/equatable.dart';
import 'package:sample_get_fetch/model/public_policy.dart';

abstract class PublicPolicyState extends Equatable {
   @override
  List<Object?> get props => [];
}

class PublicPolicyInit extends PublicPolicyState {
 
}

class PublicPolicyLoading extends PublicPolicyState {
 
}

class PublicPolicySuccess extends PublicPolicyState {
 final PublicPolicy publicPolicy;
 PublicPolicySuccess(this.publicPolicy);
}

class PublicPolicyError extends PublicPolicyState {
 final PublicPolicy publicPolicy;
 PublicPolicyError(this.publicPolicy);
}