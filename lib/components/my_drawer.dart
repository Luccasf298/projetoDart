import "package:flutterdart10/themes/theme.provider.dart";
import "package:provider/provider.dart";
import '../themes/themes.dart';
import "my_list_tile.dart";
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>().themeData;
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                DrawerHeader(
                    child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                )),
                const SizedBox(height: 25),
                MyListTile(
                    text: "comprar",
                    icon: Icons.home,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/shop_page");
                    }),
                MyListTile(
                    text: "carrinho", icon: Icons.shopping_cart, onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/cart_page");
                    })
              ]),
              Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Column(
                    children: [
                      MyListTile(
                          text: "sair",
                          
                          icon: Icons.logout,
                          onTap: () => Navigator.pushNamedAndRemoveUntil(
                              context, "/intro_page", (route) => false)),
                   MyListTile(
                    text: theme  == lightMode 
                    ? "modo escuro"
                     : "modo claro",
                    icon: theme == lightMode
                    ? Icons.toggle_off
                    : Icons.toggle_on_outlined,
                    onTap: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
                    }
                   )
                    ],
                  ))
            ]));
  }
}
