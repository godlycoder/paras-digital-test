import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paras_test/app/cubit/account/account_cubit.dart';
import 'package:paras_test/app/cubit/account/account_state.dart';
import 'package:paras_test/app/ui/component/text.dart';
import 'package:paras_test/router/router.gr.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      BlocProvider.of<AccountCubit>(context)
          .doCheckSignInStatus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCubit, AccountState>(
      listener: (_, state) {
        if (state is SignInStatusState) {
          if (state.isLoggedIn) {
            context.router.navigate(const DashboardRoute());
          } else {
            context.router.navigate(const SignInRoute());
          }
          context.router.removeLast();
        }
      },
      child: Scaffold(
        body: Center(
          child: SizedBox(
            height: 150,
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage('assets/paras_digital_logo.jpg')
                      )
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: UiKitText('Assignment test app', type: UiKitTextType.caption1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}