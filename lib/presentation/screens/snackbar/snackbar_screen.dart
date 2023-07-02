import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScren extends StatelessWidget {
  static const name = "snackbar_screen";

  const SnackbarScren({Key? key}) : super(key: key);

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text("Hola mundo"),
      action: SnackBarAction(label: "Ok!", onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

    void openDialog(BuildContext context) {

      showDialog(
        context: context,
        barrierDismissible: false, 
        builder: (context) =>  AlertDialog(
          title: const Text("¿Estás seguro?"),
          content: const Text("Pariatur aliquip voluptate ad deserunt. Mollit culpa nisi amet irure magna esse velit adipisicing do. Anim officia id minim aute nisi elit nostrud sit velit ipsum dolor fugiat quis. Excepteur ullamco laborum exercitation culpa commodo irure enim pariatur duis qui ad nulla minim proident. Deserunt Lorem ad officia ex deserunt. Aliqua duis do tempor tempor eiusmod Lorem."),
          actions: [
            TextButton(onPressed: ()=> context.pop(), child: const Text("Cancelar")),
            FilledButton(onPressed: ()=> context.pop(), child: const Text("Aceptar")),
          ],
        ));
    }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars y Diálogos"),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        "Consectetur dolore aliquip minim voluptate aliqua anim ipsum proident dolore enim consectetur irure. Ut minim veniam occaecat consectetur in ullamco. Anim quis adipisicing voluptate magna in proident sunt ex occaecat. Mollit reprehenderit aute velit do.")
                  ]);
                },
                child: const Text("Licencias usadas")),
            FilledButton.tonal(
                onPressed: () => openDialog(context), child: const Text("Mostrar diálogo.")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Mostrar Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
