using System;
using Core;
using Infrastructure;
using Infrastructure.Repositories;
using Microsoft.Extensions.DependencyInjection;
using Application;
using Newtonsoft.Json;

namespace OnionArchitecture
{
  class Program
  {
    static void Main(string[] args)
    {
      // Configurar la inyección de dependencias
      var serviceProvider = new ServiceCollection()
          .AddSingleton<DatabaseConnection>()
          .AddSingleton<IVentaRepository, VentaRepository>()
          .AddSingleton<VentaService>()
          .BuildServiceProvider();

      // Obtener el servicio de venta
      var ventaService = serviceProvider.GetService<VentaService>();

      // Definir el string JSON
      string json = "{ \"Numero\": \"123\", \"Fecha\": \"2022-01-01T00:00:00\", \"Cliente\": { \"Nombre\": \"John Doe\" }, \"Productos\": [ { \"Nombre\": \"Producto 1\", \"Precio\": 10.0 } ], \"Total\": 10.0 }";

      // Crear la venta a partir del JSON
      var venta = JsonConvert.DeserializeObject<Venta>(json);

      // Guardar la venta
      ventaService.Guardar(venta);

    }
  }
}