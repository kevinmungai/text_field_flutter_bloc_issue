import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_field_flutter_bloc_issue/register_business_form_bloc/bloc.dart';

class TypeOfBusinessEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 4, top: 8),
            child: Text("TYPE OF BUSINESS"),
          ),
          TextFormField(
            maxLines: 1,
            textCapitalization: TextCapitalization.characters,
            //textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border: OutlineInputBorder()
            ),
            onChanged: (String text) {
              BlocProvider.of<RegisterBusinessFormBloc>(context).add(ChangeBusinessType(businessType: text));
            },
          ),
        ],
      ),
    );
  }
}