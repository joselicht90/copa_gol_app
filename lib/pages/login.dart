import 'package:copa_gol_app/components/custom_text_field.dart';
import 'package:copa_gol_app/pages/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _identifierController;
  late TextEditingController _passwordController;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    _identifierController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _media = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 35,
            ),
            child: SizedBox(
              width: double.infinity,
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset(
                        'assets/img/logo512.png',
                        height: _media.orientation == Orientation.portrait
                            ? _media.size.height * 0.2
                            : _media.size.width * 0.2,
                      ),
                    ),
                    CustomTextField(
                      controller: _identifierController,
                      name: 'identifier',
                      validator: FormBuilderValidators.required(
                        context,
                        errorText: 'Debe ingresar su usario,',
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                      ),
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      name: 'password',
                      isPassword: true,
                      validator: FormBuilderValidators.required(
                        context,
                        errorText: 'Debe ingresar su contraseña,',
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/forgot_password');
                        },
                        child: Text(
                          'Olvide mi contraseña',
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.secondaryVariant,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: const Text('INGRESAR'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('No tenes una cuenta? '),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Registrate'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
