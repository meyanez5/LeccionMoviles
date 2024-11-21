
int mostrarMayorTemperatura(List<int> temperaturas) {
  // Verificamos si la lista está vacía para evitar errores
  if (temperaturas.isEmpty) {
    throw Exception("La lista de temperaturas está vacía.");
  }
  return temperaturas.reduce((a, b) => a > b ? a : b);
}
