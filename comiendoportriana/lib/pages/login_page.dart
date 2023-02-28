import 'package:comiendoportriana/pages/register_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comiendoportriana/config/locator.dart';
import '../blocs/blocs.dart';
import '../services/services.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              final authBloc = BlocProvider.of<AuthenticationBloc>(context);
              if (state is AuthenticationNotAuthenticated) {
                return _AuthForm();
              }
              if (state is AuthenticationFailure ||
                  state is SessionExpiredState) {
                var msg = (state as AuthenticationFailure).message;
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(msg),
                    TextButton(
                      //textColor: Theme.of(context).primaryColor,
                      child: Text('Retry'),
                      onPressed: () {
                        authBloc.add(AppLoaded());
                      },
                    )
                  ],
                ));
              }
              // return splash screen
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            },
          )),
    );
  }
}

class _AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final authService = RepositoryProvider.of<AuthenticationService>(context);
    final authService = getIt<JwtAuthenticationService>();
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Container(
      alignment: Alignment.center,
      child: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(authBloc, authService),
        child: _SignInForm(),
      ),
    );
  }
}

class _SignInForm extends StatefulWidget {
  @override
  __SignInFormState createState() => __SignInFormState();
}

class __SignInFormState extends State<_SignInForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);

    _onLoginButtonPressed() {
      if (_key.currentState!.validate()) {
        _loginBloc.add(LoginInWithUsernameButtonPressed(
            username: _usernameController.text,
            password: _passwordController.text));
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          _showError(state.error);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Form(
            key: _key,
            autovalidateMode: _autoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo-login.png",
                    height: 350,
                    color: Colors.red.shade800,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Nombre de Usuario',
                        filled: true,
                        isDense: true),
                    controller: _usernameController,
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null) {
                        return 'Nombre de Usuario necesario';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                    child: TextField(
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Contraseña',
                      filled: true,
                      isDense: true,
                    ),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null) {
                        return 'Contraseña necesaria';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: ElevatedButton(
                      child: Text('Inicia Sesión'),
                      onPressed:
                          state is LoginLoading ? () {} : _onLoginButtonPressed,
                      ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white),
                                            onPressed: () {
                      Navigator.push(
                            context, MaterialPageRoute(builder: (context) => RegisterFormPage()));
                      },
                      child: Text('Registrarse')),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }
}
