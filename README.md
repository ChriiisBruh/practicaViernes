# PracticaViernes


## DataBase

in the project folder you will find a file called "SCRIPTPRACTICADB", drag it to your Microsoft SQL Server to create the project database

## API Installation

Create a new Microsoft SQL Server database.

Clone the repository:

```bash
git clone https://github.com/ChriiisBruh/practicaViernes.git
```



Inside the "practicabackend" folder, you will find the file "appsettings.json" you must edit the data according to your database access credentials. data source;initial catalog;user;password

```json
{
  "ConnectionStrings": {
    "connectionmaster": "data source=DESKTOP-6V0GJCM;initial catalog=PRACTICADB;user=sa;password=Recondito123"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
```

Inside the "practicabackend" folder, run the following commands:

```bash
dotnet restore
```

```bash
dotnet run
```

## Postman use

Inside the "practicabackend" folder, you can use the practicaViernes.postman_collection.json" file to test the API functionalities.
