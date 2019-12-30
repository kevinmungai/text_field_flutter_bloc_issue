import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class RegisterBusinessType extends Equatable {
  final String businessName;
  final String businessType;
  final String emailAddress;


  RegisterBusinessType({
    @required this.emailAddress,
    @required this.businessName,
    @required this.businessType,

  });

  @override
  String toString() =>
      "RegisterBusinessType { businessName: $businessName, businessType: $businessType, emailAddress: $emailAddress }";

  @override
  List<Object> get props => [businessType, businessType, emailAddress];

  static RegisterBusinessType changeBusinessName({
    @required RegisterBusinessType registerBusinessType,
    @required String businessName,
  }) {
    return RegisterBusinessType(
      businessName: businessName,
      businessType: registerBusinessType.businessType,
      emailAddress: registerBusinessType.emailAddress,
    );
  }

  static RegisterBusinessType changeBusinessType({
    @required RegisterBusinessType registerBusinessType,
    @required String businessType,
  }) {
    return RegisterBusinessType(
      businessType: businessType,
      businessName: registerBusinessType.businessName,
      emailAddress: registerBusinessType.emailAddress,

    );
  }

  static RegisterBusinessType changeEmailAddress({
    @required RegisterBusinessType registerBusinessType,
    @required String emailAddress,
  }) {
    return RegisterBusinessType(
      emailAddress: emailAddress,
      businessName: registerBusinessType.businessName,
      businessType: registerBusinessType.businessType,
    );
  }

}