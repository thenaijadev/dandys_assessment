import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:minimalist_social_app/config/router/routes.dart';
import 'package:minimalist_social_app/core/widgets/loading_widget.dart';
import 'package:minimalist_social_app/core/widgets/text_widget.dart';
import 'package:minimalist_social_app/features/auth/presentation/bloc/auth_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(child: CircleAvatar()),
            const Gap(30),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: TextWidget(
                text: "H O M  E",
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
              onTap: () => Navigator.pop(context),
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateIsNotLoggedIn) {
                  Navigator.popAndPushNamed(context, Routes.login);
                }
              },
              builder: (context, state) {
                return state is AuthStateIsLoading
                    ? const LoadingWidget()
                    : ListTile(
                        onTap: () {
                          context.read<AuthBloc>().add(const AuthEventLogout());
                        },
                        leading: Icon(
                          Icons.logout,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        title: TextWidget(
                          text: "L O G O U T",
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
