using System;
using System.Collections.Generic;

namespace Core
{
  public class Venta
  {
    public string Numero { get; set; }
    public DateTime Fecha { get; set; }
    public Cliente Cliente { get; set; }
    public List<Producto> Productos { get; set; }
    public decimal Total { get; set; }
  }
}
