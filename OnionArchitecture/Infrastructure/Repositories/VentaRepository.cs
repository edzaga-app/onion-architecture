using System;
using System.Data;
using Microsoft.Data.SqlClient;
using Core;
using Infrastructure;

namespace Infrastructure.Repositories
{
  public class VentaRepository : IVentaRepository
  {
    private readonly DatabaseConnection _databaseConnection;

    public VentaRepository(DatabaseConnection databaseConnection)
    {
      _databaseConnection = databaseConnection;
    }

    public void Guardar(Venta venta)
    {
      using (var connection = _databaseConnection.GetConnection())
      {
        using (var command = new SqlCommand("SP_AGREGARVENTA", connection))
        {
          command.CommandType = CommandType.StoredProcedure;

          command.Parameters.AddWithValue("@Numero", venta.Numero);
          command.Parameters.AddWithValue("@Fecha", venta.Fecha);
          command.Parameters.AddWithValue("@Total", venta.Total);
          command.Parameters.AddWithValue("@ClienteId", 1);

          connection.Open();
          command.ExecuteNonQuery();

          Console.WriteLine($"Venta: Numero = {venta.Numero}, fue realizada con exito!!");

        }
        connection.Close();
      }
    }
  }
}