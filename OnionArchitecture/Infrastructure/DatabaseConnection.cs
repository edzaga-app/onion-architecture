using System;
using Microsoft.Data.SqlClient;

namespace Infrastructure
{
  public class DatabaseConnection
  {
    private readonly string _connectionString;

    public DatabaseConnection()
    {
      _connectionString = "Server=10.1.0.62;Database=onion_architecture;User Id=sa;Password=sqlserver19;TrustServerCertificate=true;";
    }

    public SqlConnection GetConnection()
    {
      return new SqlConnection(_connectionString);
    }
  }
}
