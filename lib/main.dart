import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_field_flutter_bloc_issue/business_name_entry.dart';
import 'package:text_field_flutter_bloc_issue/email_address_entry.dart';
import 'package:text_field_flutter_bloc_issue/register_business_form_bloc/bloc.dart';
import 'package:text_field_flutter_bloc_issue/type_of_business_entry.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBusinessFormBloc>(
          create: (context) => RegisterBusinessFormBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Text Field Flutter Issue",
      home: Scaffold(
        appBar: AppBar(
          title: Text("REGISTER YOUR BUSINESS"),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              BusinessNameEntry(),
              TypeOfBusinessEntry(),
              EmailAddressEntry(),
              SizedBox(height: 40),
              BlocBuilder<RegisterBusinessFormBloc, RegisterBusinessFormState>(
                builder: (context, state) {
                  if (state is CurrentBusinessFormState) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${state.registerBusinessType}"),
                    );
                  } else
                    return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

