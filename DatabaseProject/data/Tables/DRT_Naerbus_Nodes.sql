CREATE TABLE [data].[DRT_Naerbus_Nodes] (
    [node_index]                         NVARCHAR (MAX) NULL,
    [name]                               NVARCHAR (MAX) NULL,
    [district]                           NVARCHAR (MAX) NULL,
    [latitude]                           NVARCHAR (MAX) NULL,
    [longitude]                          NVARCHAR (MAX) NULL,
    [address]                            NVARCHAR (MAX) NULL,
    [roadside_index]                     NVARCHAR (MAX) NULL,
    [parsed_french_postal_code]          NVARCHAR (MAX) NULL,
    [territory_identifier]               NVARCHAR (MAX) NULL,
    [client]                             NVARCHAR (MAX) NULL,
    [can_be_parking]                     NVARCHAR (MAX) NULL,
    [is_bus_stop]                        NVARCHAR (MAX) NULL,
    [node_created_at]                    NVARCHAR (MAX) NULL,
    [node_updated_at]                    NVARCHAR (MAX) NULL,
    [geography_version]                  NVARCHAR (MAX) NULL,
    [is_latest_geography_version]        NVARCHAR (MAX) NULL,
    [geography_version_start_date]       NVARCHAR (MAX) NULL,
    [geography_version_end_date]         NVARCHAR (MAX) NULL,
    [client_partition_key]               NVARCHAR (MAX) NULL,
    [territory_identifier_partition_key] NVARCHAR (MAX) NULL
);


GO

