# Onion Architecture Project

Este proyecto implementa la arquitectura Onion y el patrón Singleton en un sistema de gestión de ventas.

## Modelo Entidad-Relación (MER)

Aquí está el modelo Entidad-Relación que se utiliza en este proyecto:

![Modelo Entidad-Relación](https://github.com/edzaga-app/onion-architecture/blob/main/mer.JPG)

## Arquitectura Onion

La arquitectura Onion se utiliza en este proyecto para mantener el acoplamiento bajo y la separación de responsabilidades alta. En esta arquitectura, el dominio y la lógica de negocio se encuentran en el centro de la aplicación, y todas las demás capas (como la capa de infraestructura y la capa de UI) dependen de ellas. Esto significa que el dominio y la lógica de negocio no dependen de ninguna otra capa, lo que hace que el sistema sea más fácil de mantener y evolucionar.

## Patrón Singleton

El patrón Singleton se utiliza en este proyecto para asegurar que sólo exista una única instancia de la conexión a la base de datos. Esto se logra al hacer que el constructor de la clase de conexión sea privado y al proporcionar un método estático que devuelve la única instancia. Este patrón es útil en este caso porque nos permite reutilizar la misma conexión a la base de datos en toda la aplicación, lo que puede mejorar el rendimiento.

## Cómo ejecutar el proyecto

1. Clona el repositorio en tu máquina local usando `git clone https://github.com/edzaga-app/onion-architecture.git`.

2. Navega al directorio del proyecto usando `cd OnionArchitecture`.

3. Asegurate de instalar las dependencias, puedes usar `dotnet restore`.

4. Antes de ejecutar el proyecto, necesitas insertar algunos datos en la base de datos.

    ```sql
    USE [onion_architecture]
    GO

    INSERT INTO [dbo].[Clientes]
               ([nombre]
               ,[direccion]
               ,[telefono])
         VALUES
               ('Juan Perez', 'Calle Principal 123', '555-1234')
    GO
    ```

5. Ahora puedes ejecutar el proyecto. usando `dotnet run`.
