import 'package:flutter/material.dart';

import '../../../../service/auth_service.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Lottie.asset('assets/lottie/menuai.json'),
                        Text('Hoşgeldin Ahmet Göksen Akyıldız'),
                        Text('Standart Üye')
                      ],
                    )),
                ListTile(
                  title: const Text('Profil'),
                  onTap: () {
                    // Update the state of the app
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Hakkımızda'),
                  onTap: () {
                    // Update the state of the app
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Dİl'),
                  onTap: () {
                    // Update the state of the app
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Log Out'),
            onTap: AuthService.to.logout,
          ),
        ],
      ),
    );
  }
}
