---
page_type: sample
languages:
- tsql
- sql
- csharp
products:
- azure
- azure-sql-database
- dotnet-core
description: "Azure SQL Database CI/CD Pipeline with GitHub Actions"
urlFragment: "azure-sql-db-ci-cd"
---

# Azure SQL Database CI/CD Pipeline with GitHub Actions

![License](https://img.shields.io/badge/license-MIT-green.svg)

<!-- 
Guidelines on README format: https://review.docs.microsoft.com/help/onboard/admin/samples/concepts/readme-template?branch=master

Guidance on onboarding samples to docs.microsoft.com/samples: https://review.docs.microsoft.com/help/onboard/admin/samples/process/onboarding?branch=master

Taxonomies for products and languages: https://review.docs.microsoft.com/new-hope/information-architecture/metadata/taxonomies?branch=master
-->

This sample shows how to use GitHub Actions to create a CI/CD pipeline using [DbUp](https://dbup.readthedocs.io/en/latest/), by sequentially applying `.sql` scripts to an existing database.

This approach is different than the one provided by usage of [SqlPackage + .BacPac](https://docs.microsoft.com/en-us/sql/tools/sqlpackage?view=sql-server-ver15) or by Database Migrations (by [.NET EF Core](https://docs.microsoft.com/en-us/ef/core/managing-schemas/migrations/?tabs=dotnet-core-cli) or [Python Django](https://docs.djangoproject.com/en/3.1/topics/migrations/) for example).

To read more about this, look here: [Philosophy Behind DbUp](https://dbup.readthedocs.io/en/latest/philosophy-behind-dbup/).

## Create a new Azure SQL database

Create a new empty Azure SQL database (if you need help: [Deploy Azure SQL Database ](https://channel9.msdn.com/Series/Azure-SQL-for-Beginners/Demo-Deploy-Azure-SQL-Database-14-of-61)). Make sure you allow Azure Services to access the created database, as described here: [Allow Azure services](https://docs.microsoft.com/en-us/azure/azure-sql/database/network-access-controls-overview#allow-azure-services)

## Create a user used for running deployment and tests

Create a user that has enough rights to execute all the needed statements used to deploy the database.  For example

```sql
CREATE USER [github_action_user] WITH PASSWORD = 'S0meVery_Very+Str0ngPazzworD!';
ALTER ROLE db_owner ADD MEMBER [github_action_user];
```

Please note that `db_owner` membership is required for this specific samples as authority to `ALTER DATABASE` is needed. If you just need to create, alter and drop objects, the following permission would be more than enough, without the need to be `db_owner`, which is a very high-privileged account.

```sql
ALTER ROLE db_ddladmin ADD MEMBER [github_action_user];
ALTER ROLE db_datareader ADD MEMBER [github_action_user];
ALTER ROLE db_datawriter ADD MEMBER [github_action_user];
```

## Get Azure SQL Connection string

Get the ADO.NET connection string to that database you just created, either via the Portal or [AZ CLI](https://docs.microsoft.com/en-us/cli/azure/sql/db?view=azure-cli-latest#az_sql_db_show_connection_string) or [Powershell]().

The connection will be something like:

```
Server=tcp:<myserver>.database.windows.net,1433;Database=github_action_user;User ID=github_action_user;Password=S0meVery_Very+Str0ngPazzworD!;Encrypt=true;Connection Timeout=30;
```

## Create a fork of this GitHub repo

Create a fork of this repository.

Once done, in Settings/Secrets create a secret named `AZURE_SQL_CONNECTION_STRING` and store the connection string of the Azure SQL database you created in the previous step.

In the forked repository go to the "Actions" tab and enable GitHub Actions.

Now push your repository. As an example you can make a small change to the README right on GitHub, or add a new - even empty - file. Commit and push the change. The GitHub Action will start.

## GitHub Action

The GitHub Action defined in `.github` folder will kick in, starting a two-step process to deploy and test database using [DbUp](http://dbup.github.io/) and NUnit. Deployment is done via the application in the `db-deploy` folder, while the tests are in the `db-test` folder.

Monitor the GitHub action. If everything worked you will see the deployment done correctly, but the tests failing.

This is expected as there is an error in the deployed stored procedure.

## Release a fix

The stored procedure has a little bug, and in fact the test is failing. A new procedure with a fix is available in the `04-fixed-stored-procedure.sql.fix` files in the `db-deploy/sql` folder. Remove the `.fix` extension so that the new extension will be just `sql` and push this change to the repo.

GitHub Action will start again, deploying only the new script and running the test again.

The test will now both succeed. Well done!

## Debugging Deployment and Testing locally

You can also run deployment and test locally, if you want or need to debug them. To do create a `.env` file starting from the `.env.template` file provided in each folder, and put the Azure SQL connection string, or a connection string to a local SQL Server database if you want to debug everything on-premises.

Then debug the programs a usual using Visual Studio or Visual Studio Code.

## Next Steps

If you want a more complex scenario, you can apply what you have learned to the following sample, forking it into new repository and adding the GitHub action for a complete CI/CD deployment pipeline

https://github.com/Azure-Samples/azure-sql-db-sync-api-change-tracking

