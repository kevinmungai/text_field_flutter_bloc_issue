import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:text_field_flutter_bloc_issue/register_business_type.dart';
import './bloc.dart';

class RegisterBusinessFormBloc extends Bloc<RegisterBusinessFormEvent, RegisterBusinessFormState> {
  @override
  RegisterBusinessFormState get initialState => InitialRegisterBusinessFormState();

  @override
  Stream<RegisterBusinessFormState> mapEventToState(
    RegisterBusinessFormEvent event,
  ) async* {
    if (event is ChangeBusinessName) {
      print("we have been called!!");
      print("event text: ${event.businessName}");

      if (state is CurrentBusinessFormState) {
        print("we are in the if");
        final previousBusinessFormState = state as CurrentBusinessFormState;
        print("previous-state ${previousBusinessFormState}");
        final RegisterBusinessType newRegisterBusinessType = RegisterBusinessType.changeBusinessName(
          registerBusinessType: previousBusinessFormState.registerBusinessType,
          businessName: event.businessName,
        );
        //print(newRegisterBusinessType);
        final newBusinessFormState = CurrentBusinessFormState(
          registerBusinessType: newRegisterBusinessType,
        );
        print("new-state $newBusinessFormState");
        yield newBusinessFormState;
        //yield previousBusinessFormState;
        print("ending the if");
      } else {
        print("we are new");
        final newBusinessFormState = CurrentBusinessFormState(
          registerBusinessType: RegisterBusinessType(
            businessName: event.businessName,
            businessType: "",
            emailAddress: "",
          ),
        );
        yield newBusinessFormState;
        print(newBusinessFormState);
      }
    }

    if (event is ChangeBusinessType) {
      if (state is CurrentBusinessFormState) {
        print("we are in the if");
        final previousBusinessFormState = state as CurrentBusinessFormState;
        print("previous-state ${previousBusinessFormState}");
        //print("BEFORE: CHANGE-BUSINESS-TYPE: ${currentBusinessFormState.registerBusinessType}");
        final RegisterBusinessType registerBusinessType = RegisterBusinessType.changeBusinessType(
          registerBusinessType: previousBusinessFormState.registerBusinessType,
          businessType: event.businessType,
        );
        //print("AFTER: CHANGE-BUSINESS-TYPE: ${registerBusinessType}");
        final newBusinessFormState = CurrentBusinessFormState(registerBusinessType: registerBusinessType);
        print(newBusinessFormState);
        yield newBusinessFormState;
      } else {
        final newBusinessFormState = CurrentBusinessFormState(
          registerBusinessType: RegisterBusinessType(
            businessName: "",
            businessType: event.businessType,
            emailAddress: "",
          ),
        );
        yield newBusinessFormState;
        print(newBusinessFormState);
      }
    }

    if (event is ChangeEmailAddress) {
      if (state is CurrentBusinessFormState) {
        final currentBusinessFormState = state as CurrentBusinessFormState;
        //print("BEFORE: CHANGE-BUSINESS-ADDRESS: ${currentBusinessFormState.registerBusinessType}");
        print("before: ${currentBusinessFormState.registerBusinessType.emailAddress}");
        final RegisterBusinessType registerBusinessType = RegisterBusinessType.changeEmailAddress(
          registerBusinessType: currentBusinessFormState.registerBusinessType,
          emailAddress: event.emailAddress,
        );
        //print("AFTER: CHANGE-EMAIL-ADDRESS: ${registerBusinessType}");
        final newBusinessFormState = CurrentBusinessFormState(registerBusinessType: registerBusinessType);
        print(newBusinessFormState);
        yield newBusinessFormState;
      } else {
        final newBusinessFormState = CurrentBusinessFormState(
          registerBusinessType: RegisterBusinessType(
            businessName: "",
            businessType: "",
            emailAddress: event.emailAddress,
          ),
        );
        yield newBusinessFormState;
        print(newBusinessFormState);
      }
    }

  }
}
