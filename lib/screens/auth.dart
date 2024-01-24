import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lisa_bot/store/cubit/user.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  AuthState createState() => AuthState();
}

class AuthState extends State<Auth> {
  bool isLoading = false;
  bool isError = false;

  late Auth0 auth0;

  @override
  void initState() {
    super.initState();
    auth0 = Auth0(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: !isLoading
            ? Center(
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final credentials =
                            await auth0.webAuthentication().login();
                        setState(() {
                          context.read<UserCubit>().setUser(credentials.user);
                          print(credentials.accessToken);
                          Navigator.pushNamed(context, "/home");
                        });
                      } catch (e) {
                        setState(() {
                          isError = true;
                        });
                      }
                    },
                    child: const Text("Log in")))
            : const Center(child: CircularProgressIndicator()));
  }
}
