import 'package:copa_gol_app/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _mailController;

  @override
  void initState() {
    _mailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _media = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 100,
                  ),
                  child: SvgPicture.asset(
                    'assets/img/forgot_password.svg',
                    height: _media.size.height * 0.3,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Por favor, ingrese su email',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        'Le enviaremos una nueva contraseña. Recuerde cambiarla.',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  controller: _mailController,
                  name: 'mail',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
