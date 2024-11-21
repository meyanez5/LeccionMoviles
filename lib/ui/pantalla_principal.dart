import 'package:flutter/material.dart';
import 'package:leccionmichelleyanez_mostrarmayortemp/logica/mostrar_mayor_temperatura.dart';

class PantallaPrincipal extends StatefulWidget {
  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  final List<TextEditingController> controllers = List.generate(10, (_) => TextEditingController());
  String resultado = "Ingrese las temperaturas";

  void calcularMayorTemperatura() {
    try {
      List<int> temperaturas = controllers.map((controller) => int.tryParse(controller.text) ?? 0).toList();
      int mayorTemperatura = mostrarMayorTemperatura(temperaturas);
      setState(() {
        resultado = "La mayor temperatura es: $mayorTemperatura °C";
      });
    } catch (e) {
      setState(() {
        resultado = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperaturas"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView( // Permite el desplazamiento si el contenido excede la pantalla
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ingresa 10 temperaturas:", style: TextStyle(fontSize: 18, color: Colors.teal)),
              SizedBox(height: 10),
              ...List.generate(10, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextField(
                    controller: controllers[index],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Temperatura ${index + 1} °C',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.thermostat_outlined),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calcularMayorTemperatura,
                child: Text("Mostrar Mayor Temperatura"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 20),
              Text(resultado, style: TextStyle(fontSize: 18, color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
