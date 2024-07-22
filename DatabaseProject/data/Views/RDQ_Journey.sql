


create view [data].[RDQ_Journey]
as
    ( select    [SourceSystemCode] ,
                [SourceSystemEntryId] = [SourceSystemEntryRef] ,
                [OperatingDayDate] ,
                [OperatingDayType] ,
                [DatedVehicleJourneyId] ,
                [DatedVehicleJourneyGid] ,
                [JourneyNumber] ,
                [JourneyPatternId] ,
                [TimedJourneyPatternId] ,
                [LineNumber] ,
                [LineDesignation] ,
                [ContractCode] ,
                [ContractorCode] ,
                [ContractorGarageCode] ,
                [PlannedStartDateTime] ,
                [PlannedEndDateTime] ,
                [PlannedStopCount] ,
                [PlannedPaidDistanceMeters] ,
                [PlannedPaidDurationSeconds] ,
                [IsExpectedByHistory] ,
                [ObservedStartDateTime] ,
                [ObservedEndDateTime] ,
                [ObservedDepartureCount] ,
                [EstimatedDepartureCount] ,
                [VehicleSourceSystemCode] ,
                [PrimaryVehicleGid] ,
                [PrimaryVehicleNumber] ,
                [PrimaryVehicleAssignedFromDateTime] ,
                [PrimaryVehicleAssignedToDateTime] ,
                [PrimaryVehicleSeconds] ,
                [PrimaryDeviceId] ,
                [PrimaryShiftNumber] ,
                [PrimaryStaffNumber] ,
                [TotalVehicleCount] ,
                [TotalVehicleSeconds] ,
                [IsReplaced] ,
                [TrackingSourceSystemCode] ,
                [PrimaryTrackingFaultyReportCount] ,
                [PrimaryTrackingTotalReportCount] ,
                [PrimaryTrackingObservedCoverageSeconds] ,
                [PrimaryTrackingObservedCoverage] ,
                [TotalCheckInCount] ,
                [TotalCheckOutCount] ,
                [TotalCashTicketCount] ,
                [TotalCashTicketAmount]
      from      [data].[RT_Journey]
    );

GO

