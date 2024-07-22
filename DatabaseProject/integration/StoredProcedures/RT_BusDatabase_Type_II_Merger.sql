


-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [integration].[RT_BusDatabase_Type_II_Merger]
as
begin
    declare
        @Yesterday date = dateadd(dd, -1, cast(getdate() as date))
       ,@Today date = cast(getdate() as date);

    insert into
        data.RT_BusDatabase
    (
        Id
       ,InternalNumber
       ,RegistrationNumber
       ,ChassisNumber
       ,ChassisSupplier
       ,BodySupplier
       ,BusModel
       ,BusType
       ,FloorType
       ,Contractor
       ,SubContractor
       ,SpecialEquipment
       ,Aircon
       ,DesignPainting
       ,NumberOfSeats
       ,NumberOfFoldingSeats
       ,NumberOfPitches
       ,ApprovedTotalCapacity
       ,DoorConfiguration
       ,NumberOfBabyCarriages
       ,Length
       ,Width
       ,Height
       ,ShaftDistance
       ,OwnWeight
       ,TotalWeight
       ,EmissionNorm
       ,Fuel
       ,EmissionsEquipment
       ,NOx
       ,Hc
       ,Co
       ,Pm
       ,DieselConsumptionSORT1
       ,DieselConsumptionSORT2
       ,DieselConsumptionSORT3
       ,CO2PerKMSORT1
       ,CO2PerKMSORT2
       ,CO2PerKMSORT3
       ,Efficiency
       ,NoiseInside2008
       ,NoiseOutside2008
       ,NoiseInside2017
       ,NoiseOutside2017
       ,Garage
       ,Procurement
       ,ContractUnit
       ,Infotainment
       ,Lines
       ,ReserveBus
       ,FirstRegistrationDate
       ,FirstCommissioningDate
       ,InUse
       ,Obs
       ,InfotainmentSupplier
       ,OperatingTermination
       ,Flowtype
       ,CountBus
       ,NewRealTime
       ,SupplierRealTime
       ,LastModified
       ,GarageRef
       ,GarageAddress
       ,ContractorRef
       ,ValidFromDate
       ,IsCurrent
    )
    select
        Id
       ,InternalNumber
       ,RegistrationNumber
       ,ChassisNumber
       ,ChassisSupplier
       ,BodySupplier
       ,BusModel
       ,BusType
       ,FloorType
       ,Contractor
       ,SubContractor
       ,SpecialEquipment
       ,Aircon
       ,DesignPainting
       ,NumberOfSeats
       ,NumberOfFoldingSeats
       ,NumberOfPitches
       ,ApprovedTotalCapacity
       ,DoorConfiguration
       ,NumberOfBabyCarriages
       ,Length
       ,Width
       ,Height
       ,ShaftDistance
       ,OwnWeight
       ,TotalWeight
       ,EmissionNorm
       ,Fuel
       ,EmissionsEquipment
       ,NOx
       ,Hc
       ,Co
       ,Pm
       ,DieselConsumptionSORT1
       ,DieselConsumptionSORT2
       ,DieselConsumptionSORT3
       ,CO2PerKMSORT1
       ,CO2PerKMSORT2
       ,CO2PerKMSORT3
       ,Efficiency
       ,NoiseInside2008
       ,NoiseOutside2008
       ,NoiseInside2017
       ,NoiseOutside2017
       ,Garage
       ,Procurement
       ,ContractUnit
       ,Infotainment
       ,Lines
       ,ReserveBus
       ,FirstRegistrationDate
       ,FirstCommissioningDate
       ,InUse
       ,Obs
       ,InfotainmentSupplier
       ,OperatingTermination
       ,Flowtype
       ,CountBus
       ,NewRealTime
       ,SupplierRealTime
       ,LastModified
       ,GarageRef
       ,GarageAddress
       ,ContractorRef
       ,@Today
       ,1
    from (
        -- Merge statement
        merge into data.RT_BusDatabase as DST
        using stg.RT_BusDatabase as SRC
        on (SRC.InternalNumber = DST.InternalNumber)
        -- New records inserted
        when not matched then
            insert (
                Id
               ,InternalNumber
               ,RegistrationNumber
               ,ChassisNumber
               ,ChassisSupplier
               ,BodySupplier
               ,BusModel
               ,BusType
               ,FloorType
               ,Contractor
               ,SubContractor
               ,SpecialEquipment
               ,Aircon
               ,DesignPainting
               ,NumberOfSeats
               ,NumberOfFoldingSeats
               ,NumberOfPitches
               ,ApprovedTotalCapacity
               ,DoorConfiguration
               ,NumberOfBabyCarriages
               ,Length
               ,Width
               ,Height
               ,ShaftDistance
               ,OwnWeight
               ,TotalWeight
               ,EmissionNorm
               ,Fuel
               ,EmissionsEquipment
               ,NOx
               ,Hc
               ,Co
               ,Pm
               ,DieselConsumptionSORT1
               ,DieselConsumptionSORT2
               ,DieselConsumptionSORT3
               ,CO2PerKMSORT1
               ,CO2PerKMSORT2
               ,CO2PerKMSORT3
               ,Efficiency
               ,NoiseInside2008
               ,NoiseOutside2008
               ,NoiseInside2017
               ,NoiseOutside2017
               ,Garage
               ,Procurement
               ,ContractUnit
               ,Infotainment
               ,Lines
               ,ReserveBus
               ,FirstRegistrationDate
               ,FirstCommissioningDate
               ,InUse
               ,Obs
               ,InfotainmentSupplier
               ,OperatingTermination
               ,Flowtype
               ,CountBus
               ,NewRealTime
               ,SupplierRealTime
               ,LastModified
               ,GarageRef
               ,GarageAddress
               ,ContractorRef
               ,ValidFromDate
               ,IsCurrent
            )
            values
            (
                SRC.Id, SRC.InternalNumber, SRC.RegistrationNumber, SRC.ChassisNumber, SRC.ChassisSupplier, SRC.BodySupplier
                , SRC.BusModel, SRC.BusType, SRC.FloorType, SRC.Contractor, SRC.SubContractor, SRC.SpecialEquipment, SRC.Aircon, SRC.DesignPainting
                , SRC.NumberOfSeats, SRC.NumberOfFoldingSeats, SRC.NumberOfPitches, SRC.ApprovedTotalCapacity, SRC.DoorConfiguration
                , SRC.NumberOfBabyCarriages, SRC.Length, SRC.Width, SRC.Height, SRC.ShaftDistance, SRC.OwnWeight, SRC.TotalWeight, SRC.EmissionNorm, SRC.Fuel
                , SRC.EmissionsEquipment, SRC.NOx, SRC.Hc, SRC.Co, SRC.Pm, SRC.DieselConsumptionSORT1, SRC.DieselConsumptionSORT2
                , SRC.DieselConsumptionSORT3, SRC.CO2PerKMSORT1, SRC.CO2PerKMSORT2, SRC.CO2PerKMSORT3, SRC.Efficiency, SRC.NoiseInside2008
                , SRC.NoiseOutside2008, SRC.NoiseInside2017, SRC.NoiseOutside2017, SRC.Garage, SRC.Procurement, SRC.ContractUnit, SRC.Infotainment
                , SRC.Lines, SRC.ReserveBus, SRC.FirstRegistrationDate, SRC.FirstCommissioningDate, SRC.InUse, SRC.Obs, SRC.InfotainmentSupplier
                , SRC.OperatingTermination, SRC.Flowtype, SRC.CountBus, SRC.NewRealTime, SRC.SupplierRealTime, SRC.LastModified, SRC.GarageRef
                , SRC.GarageAddress, SRC.ContractorRef
                , @Today, 1
            )
        -- Existing records updated if data changes
        when matched and IsCurrent = 1
                         and (
                             isnull(DST.Id, '') <> isnull(SRC.Id, '')
                             or isnull(DST.RegistrationNumber, '') <> isnull(SRC.RegistrationNumber, '')
                             or isnull(DST.ChassisNumber, '') <> isnull(SRC.ChassisNumber, '')
                             or isnull(DST.ChassisSupplier, '') <> isnull(SRC.ChassisSupplier, '')
                             or isnull(DST.BodySupplier, '') <> isnull(SRC.BodySupplier, '')
                             or isnull(DST.BusModel, '') <> isnull(SRC.BusModel, '')
                             or isnull(DST.BusType, '') <> isnull(SRC.BusType, '')
                             or isnull(DST.FloorType, '') <> isnull(SRC.FloorType, '')
                             or isnull(DST.Contractor, '') <> isnull(SRC.Contractor, '')
                             or isnull(DST.SubContractor, '') <> isnull(SRC.SubContractor, '')
                             or isnull(DST.SpecialEquipment, '') <> isnull(SRC.SpecialEquipment, '')
                             or isnull(DST.Aircon, '') <> isnull(SRC.Aircon, '')
                             or isnull(DST.DesignPainting, '') <> isnull(SRC.DesignPainting, '')
                             or isnull(DST.NumberOfSeats, '') <> isnull(SRC.NumberOfSeats, '')
                             or isnull(DST.NumberOfFoldingSeats, '') <> isnull(SRC.NumberOfFoldingSeats, '')
                             or isnull(DST.NumberOfPitches, '') <> isnull(SRC.NumberOfPitches, '')
                             or isnull(DST.ApprovedTotalCapacity, '') <> isnull(SRC.ApprovedTotalCapacity, '')
                             or isnull(DST.DoorConfiguration, '') <> isnull(SRC.DoorConfiguration, '')
                             or isnull(DST.NumberOfBabyCarriages, '') <> isnull(SRC.NumberOfBabyCarriages, '')
                             or isnull(DST.Length, '') <> isnull(SRC.Length, '')
                             or isnull(DST.Width, '') <> isnull(SRC.Width, '')
                             or isnull(DST.Height, '') <> isnull(SRC.Height, '')
                             or isnull(DST.ShaftDistance, '') <> isnull(SRC.ShaftDistance, '')
                             or isnull(DST.OwnWeight, '') <> isnull(SRC.OwnWeight, '')
                             or isnull(DST.TotalWeight, '') <> isnull(SRC.TotalWeight, '')
                             or isnull(DST.EmissionNorm, '') <> isnull(SRC.EmissionNorm, '')
                             or isnull(DST.Fuel, '') <> isnull(SRC.Fuel, '')
                             or isnull(DST.EmissionsEquipment, '') <> isnull(SRC.EmissionsEquipment, '')
                             or isnull(DST.NOx, '') <> isnull(SRC.NOx, '')
                             or isnull(DST.Hc, '') <> isnull(SRC.Hc, '')
                             or isnull(DST.Co, '') <> isnull(SRC.Co, '')
                             or isnull(DST.Pm, '') <> isnull(SRC.Pm, '')
                             or isnull(DST.DieselConsumptionSORT1, '') <> isnull(SRC.DieselConsumptionSORT1, '')
                             or isnull(DST.DieselConsumptionSORT2, '') <> isnull(SRC.DieselConsumptionSORT2, '')
                             or isnull(DST.DieselConsumptionSORT3, '') <> isnull(SRC.DieselConsumptionSORT3, '')
                             or isnull(DST.CO2PerKMSORT1, '') <> isnull(SRC.CO2PerKMSORT1, '')
                             or isnull(DST.CO2PerKMSORT2, '') <> isnull(SRC.CO2PerKMSORT2, '')
                             or isnull(DST.CO2PerKMSORT3, '') <> isnull(SRC.CO2PerKMSORT3, '')
                             or isnull(DST.Efficiency, '') <> isnull(SRC.Efficiency, '')
                             or isnull(DST.NoiseInside2008, '') <> isnull(SRC.NoiseInside2008, '')
                             or isnull(DST.NoiseOutside2008, '') <> isnull(SRC.NoiseOutside2008, '')
                             or isnull(DST.NoiseInside2017, '') <> isnull(SRC.NoiseInside2017, '')
                             or isnull(DST.NoiseOutside2017, '') <> isnull(SRC.NoiseOutside2017, '')
                             or isnull(DST.Garage, '') <> isnull(SRC.Garage, '')
                             or isnull(DST.Procurement, '') <> isnull(SRC.Procurement, '')
                             or isnull(DST.ContractUnit, '') <> isnull(SRC.ContractUnit, '')
                             or isnull(DST.Infotainment, '') <> isnull(SRC.Infotainment, '')
                             or isnull(DST.Lines, '') <> isnull(SRC.Lines, '')
                             or isnull(DST.ReserveBus, '') <> isnull(SRC.ReserveBus, '')
                             or isnull(DST.FirstRegistrationDate, '') <> isnull(SRC.FirstRegistrationDate, '')
                             or isnull(DST.FirstCommissioningDate, '') <> isnull(SRC.FirstCommissioningDate, '')
                             or isnull(DST.InUse, '') <> isnull(SRC.InUse, '')
                             or isnull(DST.Obs, '') <> isnull(SRC.Obs, '')
                             or isnull(DST.InfotainmentSupplier, '') <> isnull(SRC.InfotainmentSupplier, '')
                             or isnull(DST.OperatingTermination, '') <> isnull(SRC.OperatingTermination, '')
                             or isnull(DST.Flowtype, '') <> isnull(SRC.Flowtype, '')
                             or isnull(DST.CountBus, '') <> isnull(SRC.CountBus, '')
                             or isnull(DST.NewRealTime, '') <> isnull(SRC.NewRealTime, '')
                             or isnull(DST.SupplierRealTime, '') <> isnull(SRC.SupplierRealTime, '')
                             or isnull(DST.LastModified, '') <> isnull(SRC.LastModified, '')
                             or isnull(DST.GarageRef, '') <> isnull(SRC.GarageRef, '')
                             or isnull(DST.GarageAddress, '') <> isnull(SRC.GarageAddress, '')
                             or isnull(DST.ContractorRef, '') <> isnull(SRC.ContractorRef, '')
                         )
        -- Update statement for a changed dimension reCord, to flag as no longer active
        then update set
                 DST.IsCurrent = 0
                ,DST.ValidToDate = @Yesterday
        output
            SRC.InternalNumber
           ,SRC.RegistrationNumber
           ,SRC.ChassisNumber
           ,SRC.ChassisSupplier
           ,SRC.BodySupplier
           ,SRC.BusModel
           ,SRC.BusType
           ,SRC.FloorType
           ,SRC.Contractor
           ,SRC.SubContractor
           ,SRC.SpecialEquipment
           ,SRC.Aircon
           ,SRC.DesignPainting
           ,SRC.NumberOfSeats
           ,SRC.NumberOfFoldingSeats
           ,SRC.NumberOfPitches
           ,SRC.ApprovedTotalCapacity
           ,SRC.DoorConfiguration
           ,SRC.NumberOfBabyCarriages
           ,SRC.Length
           ,SRC.Width
           ,SRC.Height
           ,SRC.ShaftDistance
           ,SRC.OwnWeight
           ,SRC.TotalWeight
           ,SRC.EmissionNorm
           ,SRC.Fuel
           ,SRC.EmissionsEquipment
           ,SRC.NOx
           ,SRC.Hc
           ,SRC.Co
           ,SRC.Pm
           ,SRC.DieselConsumptionSORT1
           ,SRC.DieselConsumptionSORT2
           ,SRC.DieselConsumptionSORT3
           ,SRC.CO2PerKMSORT1
           ,SRC.CO2PerKMSORT2
           ,SRC.CO2PerKMSORT3
           ,SRC.Efficiency
           ,SRC.NoiseInside2008
           ,SRC.NoiseOutside2008
           ,SRC.NoiseInside2017
           ,SRC.NoiseOutside2017
           ,SRC.Garage
           ,SRC.Procurement
           ,SRC.ContractUnit
           ,SRC.Infotainment
           ,SRC.Lines
           ,SRC.ReserveBus
           ,SRC.FirstRegistrationDate
           ,SRC.FirstCommissioningDate
           ,SRC.InUse
           ,SRC.Obs
           ,SRC.InfotainmentSupplier
           ,SRC.OperatingTermination
           ,SRC.Flowtype
           ,SRC.CountBus
           ,SRC.NewRealTime
           ,SRC.SupplierRealTime
           ,SRC.LastModified
           ,SRC.GarageRef
           ,SRC.GarageAddress
           ,SRC.ContractorRef
           ,SRC.Id
           ,$Action as MergeAction
    )   as MRG
    where
        MRG.MergeAction = 'UPDATE';
end;

GO

