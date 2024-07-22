CREATE TABLE [data].[DRT_Naerbus_Search] (
    [Search ID]                             NVARCHAR (MAX) NULL,
    [Search Date & Time]                    NVARCHAR (MAX) NULL,
    [Departure/Arrival]                     NVARCHAR (MAX) NULL,
    [Next Service]                          NVARCHAR (MAX) NULL,
    [Trip Date & Time]                      NVARCHAR (MAX) NULL,
    [Passengers]                            NVARCHAR (MAX) NULL,
    [User ID]                               NVARCHAR (MAX) NULL,
    [Origin Address]                        NVARCHAR (MAX) NULL,
    [Destination Address]                   NVARCHAR (MAX) NULL,
    [Pickup ID]                             NVARCHAR (MAX) NULL,
    [Pickup]                                NVARCHAR (MAX) NULL,
    [Dropoff ID]                            NVARCHAR (MAX) NULL,
    [Dropoff]                               NVARCHAR (MAX) NULL,
    [Voted?]                                NVARCHAR (MAX) NULL,
    [Price]                                 NVARCHAR (MAX) NULL,
    [First pickup datetime proposed]        NVARCHAR (MAX) NULL,
    [First dropoff datetime proposed]       NVARCHAR (MAX) NULL,
    [Best dropoff datetime proposed]        NVARCHAR (MAX) NULL,
    [Best pickup datetime proposed]         NVARCHAR (MAX) NULL,
    [Booking ID]                            NVARCHAR (MAX) NULL,
    [Booking Date & Time]                   NVARCHAR (MAX) NULL,
    [Is Pickup Standard]                    NVARCHAR (MAX) NULL,
    [Is Dropoff Standard]                   NVARCHAR (MAX) NULL,
    [Pickup Walking Time]                   NVARCHAR (MAX) NULL,
    [Dropoff Walking Time]                  NVARCHAR (MAX) NULL,
    [First Proposition With Standard Nodes] NVARCHAR (MAX) NULL,
    [Error Code]                            NVARCHAR (MAX) NULL,
    [No. standard passengers]               NVARCHAR (MAX) NULL,
    [No. non-standard passengers]           NVARCHAR (MAX) NULL,
    [Non-standard passenger details]        NVARCHAR (MAX) NULL,
    [client]                                NVARCHAR (MAX) NULL,
    [territory_identifier]                  NVARCHAR (MAX) NULL,
    [export_month]                          NVARCHAR (MAX) NULL
);


GO

