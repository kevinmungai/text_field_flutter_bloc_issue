import 'package:equatable/equatable.dart';
import 'package:text_field_flutter_bloc_issue/register_business_type.dart';
import 'package:meta/meta.dart';

abstract class RegisterBusinessFormState extends Equatable {
  const RegisterBusinessFormState();
}

class InitialRegisterBusinessFormState extends RegisterBusinessFormState {
  @override
  List<Object> get props => [];
}


class CurrentBusinessFormState extends RegisterBusinessFormState {
  final RegisterBusinessType registerBusinessType;

  CurrentBusinessFormState({@required this.registerBusinessType});

  @override
  List<Object> get props => [registerBusinessType];

  @override
  String toString() => "CurrentBusinessFormState { registerBusinessType: $registerBusinessType }";
}