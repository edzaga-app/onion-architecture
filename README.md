# Onion Architecture Project

Este proyecto implementa la arquitectura Onion y el patr�n Singleton en un sistema de gesti�n de ventas.

## Modelo Entidad-Relaci�n (MER)

Aqu� est� el modelo Entidad-Relaci�n que se utiliza en este proyecto:

![Modelo Entidad-Relaci�n](https://github.com/edzaga-app/onion-architecture/blob/main/mer.JPG)

## Arquitectura Onion

La arquitectura Onion se utiliza en este proyecto para mantener el acoplamiento bajo y la separaci�n de responsabilidades alta. En esta arquitectura, el dominio y la l�gica de negocio se encuentran en el centro de la aplicaci�n, y todas las dem�s capas (como la capa de infraestructura y la capa de UI) dependen de ellas. Esto significa que el dominio y la l�gica de negocio no dependen de ninguna otra capa, lo que hace que el sistema sea m�s f�cil de mantener y evolucionar.

## Patr�n Singleton

El patr�n Singleton se utiliza en este proyecto para asegurar que s�lo exista una �nica instancia de la conexi�n a la base de datos. Esto se logra al hacer que el constructor de la clase de conexi�n sea privado y al proporcionar un m�todo est�tico que devuelve la �nica instancia. Este patr�n es �til en este caso porque nos permite reutilizar la misma conexi�n a la base de datos en toda la aplicaci�n, lo que puede mejorar el rendimiento.

## C�mo ejecutar el proyecto

1. Clona el repositorio en tu m�quina local usando `git clone https://github.com/edzaga-app/onion-architecture.git`.

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
