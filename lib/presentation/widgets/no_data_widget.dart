import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final VoidCallback onLoad;

  const NoDataWidget({super.key, required this.onLoad});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Todavía no hay datos, pulsa el botón',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: onLoad,
            icon: Icon(Icons.refresh_outlined),
            label: Text('Cargar personaje'),
          ),
        ],
      ),
    );
  }
}
