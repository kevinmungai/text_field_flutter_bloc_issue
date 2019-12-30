import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterBusinessFormEvent extends Equatable {
  const RegisterBusinessFormEvent();
}



class ChangeBusinessName extends RegisterBusinessFormEvent {
  final String businessName;

  ChangeBusinessName({@required this.businessName});

  @override
  List<Object> get props => [businessName];
}

class ChangeBusinessType extends RegisterBusinessFormEvent {
  final String businessType;

  ChangeBusinessType({@required this.businessType});

  @override
  List<Object> get props => [businessType];
}

class ChangeEmailAddress extends RegisterBusinessFormEvent {
  final String emailAddress;

  ChangeEmailAddress({@required this.emailAddress});

  @override
  List<Object> get props => [emailAddress];
}