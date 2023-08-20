import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando peliculas',
      'Comprando palomitas de maíz',
      'Cargando populares',
      'Invitando a mis amigos',
      'Ya casi...',
      'Esto ya está tardando mucho, ¿no?',
    ];
    return Stream.periodic(
      const Duration(milliseconds: 1200),
      (step) => messages[step],
    ).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espera por favor'),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SlideInLeft(child: const Text('Cargando'));
              }
              return SlideInLeft(child: Text(snapshot.data!));
            },
          )
        ],
      ),
    );
  }
}
