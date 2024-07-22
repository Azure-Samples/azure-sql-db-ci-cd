using System;
using System.Reflection;
using DbUp;

namespace AzureSQLDevelopers.Database.Deploy
{
    class Program
    {
        static int Main(string[] args)
        {
            DotNetEnv.Env.Load();

            var connectionString = Environment.GetEnvironmentVariable("ConnectionString");

            var upgrader = DeployChanges.To
                .SqlDatabase(connectionString)
                .JournalToSqlTable("dbo", "$__schema_journal")
                .WithScriptsFromFileSystem("./sql")                                
                .LogToConsole()
                .Build();

            var result = upgrader.PerformUpgrade();

            if (!result.Successful)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(result.Error);
                Console.ResetColor();
                return -1;
            }

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Success!");
            Console.ResetColor();
            return 0;
        }
    }
}
