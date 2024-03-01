using System;
using Core;

namespace Application
{
  public class VentaService
  {
    private readonly IVentaRepository _ventaRepository;

    public VentaService(IVentaRepository ventaRepository)
    {
      _ventaRepository = ventaRepository;
    }

    public void Guardar(Venta venta)
    {
      _ventaRepository.Guardar(venta);
    }
  }
}