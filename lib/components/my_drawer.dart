import "package:chat_app/auth/auth_service.dart";
import "package:chat_app/pages/settings_page.dart";
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Logo
          Column(
            children: [
              const DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    size: 50, /*color: Theme.of(context).colorScheme.primary*/
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: const Icon(Icons.home),
                  // textColor: Theme.of(context).colorScheme.primary,
                  // iconColor: Theme.of(context).colorScheme.primary,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading: const Icon(Icons.settings),
                  // textColor: Theme.of(context).colorScheme.primary,
                  // iconColor: Theme.of(context).colorScheme.primary,
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              // textColor: Theme.of(context).colorScheme.primary,
              // iconColor: Theme.of(context).colorScheme.primary,
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
