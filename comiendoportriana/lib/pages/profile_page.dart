import 'package:comiendoportriana/blocs/profile/profile_bloc.dart';
import 'package:comiendoportriana/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comiendoportriana/blocs/authentication/authentication.dart';
import 'package:comiendoportriana/blocs/login/login_bloc.dart';

import '../models/login.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(FetchUserEvent()),
      child: ProfileUI(),
    );
  }
}

class ProfileUI extends StatefulWidget {
  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  bool _showAccOptions = false;
  bool _canDeleteAccount = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        switch (state.status) {
          case ProfileStatus.failure:
            return Center(
                child: Column(
              children: [
                Text('Fallo al cargar'),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthenticationBloc>().add(UserLoggedOut());
                  },
                  child: Text("Reintentar"),
                )
              ],
            ));
          case ProfileStatus.standard:
            return SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(children: [
                  Text(
                    state.user!.username!,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 50),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Nombre Completo:', style: TextStyle( fontSize: 15),),
                        Text(' ${state.user!.fullName}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          context
                              .read<AuthenticationBloc>()
                              .add(UserLoggedOut());
                        },
                        child: Text(
                          "Cerrar Sesión",
                        )),
                  ),
                ]),
              ),
            ));
            
            case ProfileStatus.initial:
              return CircularProgressIndicator();
        }
      },
    );
  }
}
