
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [integration].[RT_BusDatabase_Type_I_Merger]
as
begin
merge into data.RT_BusDatabase as DST
using stg.RT_BusDatabase as SRC
on (SRC.InternalNumber = DST.InternalNumber)
when matched 
and DST.ValidFromDate = cast(getdate() as date)
and (
       isnull(DST.Id,'') <> isnull(SRC.Id,'') 
 or isnull(DST.RegistrationNumber,'') <> isnull(SRC.RegistrationNumber,'') 
 or isnull(DST.ChassisNumber,'') <> isnull(SRC.ChassisNumber,'')
 or isnull(DST.ChassisSupplier,'') <> isnull(SRC.ChassisSupplier,'')
 or isnull(DST.BodySupplier,'') <> isnull(SRC.BodySupplier,'')
 or isnull(DST.BusModel,'') <> isnull(SRC.BusModel,'')
 or isnull(DST.BusType,'') <> isnull(SRC.BusType,'')
 or isnull(DST.FloorType,'') <> isnull(SRC.FloorType,'')
 or isnull(DST.Contractor,'') <> isnull(SRC.Contractor,'')
 or isnull(DST.SubContractor,'') <> isnull(SRC.SubContractor,'')
 or isnull(DST.SpecialEquiPment,'') <> isnull(SRC.SpecialEquiPment,'')
 or isnull(DST.AirCon,'') <> isnull(SRC.AirCon,'')
 or isnull(DST.DesignPainting,'') <> isnull(SRC.DesignPainting,'')
 or isnull(DST.NumberOfSeats,'') <> isnull(SRC.NumberOfSeats,'')
 or isnull(DST.NumberOfFoldingSeats,'') <> isnull(SRC.NumberOfFoldingSeats,'')
 or isnull(DST.NumberOfPitches,'') <> isnull(SRC.NumberOfPitches,'')
 or isnull(DST.ApprovedTotalCapacity,'') <> isnull(SRC.ApprovedTotalCapacity,'')
 or isnull(DST.DoorConfiguration,'') <> isnull(SRC.DoorConfiguration,'')
 or isnull(DST.NumberOfBabyCarriages,'') <> isnull(SRC.NumberOfBabyCarriages,'')
 or isnull(DST.Length,'') <> isnull(SRC.Length,'')
 or isnull(DST.Width,'') <> isnull(SRC.Width,'')
 or isnull(DST.Height,'') <> isnull(SRC.Height,'')
 or isnull(DST.ShaftDistance,'') <> isnull(SRC.ShaftDistance,'')
 or isnull(DST.OwnWeight,'') <> isnull(SRC.OwnWeight,'')
 or isnull(DST.TotalWeight,'') <> isnull(SRC.TotalWeight,'')
 or isnull(DST.EmissionNorm,'') <> isnull(SRC.EmissionNorm,'')
 or isnull(DST.Fuel,'') <> isnull(SRC.Fuel,'')
 or isnull(DST.EmissionsEquiPment,'') <> isnull(SRC.EmissionsEquiPment,'')
 or isnull(DST.NOx,'') <> isnull(SRC.NOx,'')
 or isnull(DST.Hc,'') <> isnull(SRC.Hc,'')
 or isnull(DST.Co,'') <> isnull(SRC.Co,'')
 or isnull(DST.Pm,'') <> isnull(SRC.Pm,'')
 or isnull(DST.DieselConsumptionSORT1,'') <> isnull(SRC.DieselConsumptionSORT1,'')
 or isnull(DST.DieselConsumptionSORT2,'') <> isnull(SRC.DieselConsumptionSORT2,'')
 or isnull(DST.DieselConsumptionSORT3,'') <> isnull(SRC.DieselConsumptionSORT3,'')
 or isnull(DST.CO2PerKMSORT1,'') <> isnull(SRC.CO2PerKMSORT1,'')
 or isnull(DST.CO2PerKMSORT2,'') <> isnull(SRC.CO2PerKMSORT2,'')
 or isnull(DST.CO2PerKMSORT3,'') <> isnull(SRC.CO2PerKMSORT3,'')
 or isnull(DST.Efficiency,'') <> isnull(SRC.Efficiency,'')
 or isnull(DST.NoiseInside2008,'') <> isnull(SRC.NoiseInside2008,'')
 or isnull(DST.NoiseOutside2008,'') <> isnull(SRC.NoiseOutside2008,'')
 or isnull(DST.NoiseInside2017,'') <> isnull(SRC.NoiseInside2017,'')
 or isnull(DST.NoiseOutside2017,'') <> isnull(SRC.NoiseOutside2017,'')
 or isnull(DST.Garage,'') <> isnull(SRC.Garage,'')
 or isnull(DST.Procurement,'') <> isnull(SRC.Procurement,'')
 or isnull(DST.ContractUnit,'') <> isnull(SRC.ContractUnit,'')
 or isnull(DST.Infotainment,'') <> isnull(SRC.Infotainment,'')
 or isnull(DST.Lines,'') <> isnull(SRC.Lines,'')
 or isnull(DST.ReserveBus,'') <> isnull(SRC.ReserveBus,'')
 or isnull(DST.FirstRegistrationDate,'') <> isnull(SRC.FirstRegistrationDate,'')
 or isnull(DST.FirstCommissioningDate,'') <> isnull(SRC.FirstCommissioningDate,'')
 or isnull(DST.InUse,'') <> isnull(SRC.InUse,'')
 or isnull(DST.Obs,'') <> isnull(SRC.Obs,'')
 or isnull(DST.InfotainmentSupplier,'') <> isnull(SRC.InfotainmentSupplier,'')
 or isnull(DST.OperatingTermination,'') <> isnull(SRC.OperatingTermination,'')
 or isnull(DST.Flowtype,'') <> isnull(SRC.Flowtype,'')
 or isnull(DST.CountBus,'') <> isnull(SRC.CountBus,'')
 or isnull(DST.NewRealTime,'') <> isnull(SRC.NewRealTime,'')
 or isnull(DST.SupplierRealTime,'') <> isnull(SRC.SupplierRealTime,'')
 or isnull(DST.LastModified,'') <> isnull(SRC.LastModified,'')
 or isnull(DST.GarageRef,'') <> isnull(SRC.GarageRef,'')
 or isnull(DST.GarageAddress,'') <> isnull(SRC.GarageAddress,'')
 or isnull(DST.ContractorRef,'') <> isnull(SRC.ContractorRef,'')
 )
then update 
set
  DST.Id = SRC.Id 
 ,DST.InternalNumber = SRC.InternalNumber
 ,DST.RegistrationNumber = SRC.RegistrationNumber 
 ,DST.ChassisNumber = SRC.ChassisNumber
 ,DST.ChassisSupplier = SRC.ChassisSupplier
 ,DST.BodySupplier = SRC.BodySupplier
 ,DST.BusModel = SRC.BusModel
 ,DST.BusType = SRC.BusType
 ,DST.FloorType = SRC.FloorType
 ,DST.Contractor = SRC.Contractor
 ,DST.SubContractor = SRC.SubContractor
 ,DST.SpecialEquiPment = SRC.SpecialEquiPment
 ,DST.AirCon = SRC.AirCon
 ,DST.DesignPainting = SRC.DesignPainting
 ,DST.NumberOfSeats = SRC.NumberOfSeats
 ,DST.NumberOfFoldingSeats = SRC.NumberOfFoldingSeats
 ,DST.NumberOfPitches = SRC.NumberOfPitches
 ,DST.ApprovedTotalCapacity = SRC.ApprovedTotalCapacity
 ,DST.DoorConfiguration = SRC.DoorConfiguration
 ,DST.NumberOfBabyCarriages = SRC.NumberOfBabyCarriages
 ,DST.Length = SRC.Length
 ,DST.Width = SRC.Width
 ,DST.Height = SRC.Height
 ,DST.ShaftDistance = SRC.ShaftDistance
 ,DST.OwnWeight = SRC.OwnWeight
 ,DST.TotalWeight = SRC.TotalWeight
 ,DST.EmissionNorm = SRC.EmissionNorm
 ,DST.Fuel = SRC.Fuel
 ,DST.EmissionsEquiPment = SRC.EmissionsEquiPment
 ,DST.NOx = SRC.NOx
 ,DST.Hc = SRC.Hc
 ,DST.Co = SRC.Co
 ,DST.Pm = SRC.Pm
 ,DST.DieselConsumptionSORT1 = SRC.DieselConsumptionSORT1
 ,DST.DieselConsumptionSORT2 = SRC.DieselConsumptionSORT2
 ,DST.DieselConsumptionSORT3 = SRC.DieselConsumptionSORT3
 ,DST.CO2PerKMSORT1 = SRC.CO2PerKMSORT1
 ,DST.CO2PerKMSORT2 = SRC.CO2PerKMSORT2
 ,DST.CO2PerKMSORT3 = SRC.CO2PerKMSORT3
 ,DST.Efficiency = SRC.Efficiency
 ,DST.NoiseInside2008 = SRC.NoiseInside2008
 ,DST.NoiseOutside2008 = SRC.NoiseOutside2008
 ,DST.NoiseInside2017 = SRC.NoiseInside2017
 ,DST.NoiseOutside2017 = SRC.NoiseOutside2017
 ,DST.Garage = SRC.Garage
 ,DST.Procurement = SRC.Procurement
 ,DST.ContractUnit = SRC.ContractUnit
 ,DST.Infotainment = SRC.Infotainment
 ,DST.Lines = SRC.Lines
 ,DST.ReserveBus = SRC.ReserveBus
 ,DST.FirstRegistrationDate = SRC.FirstRegistrationDate
 ,DST.FirstCommissioningDate = SRC.FirstCommissioningDate
 ,DST.InUse = SRC.InUse
 ,DST.Obs = SRC.Obs
 ,DST.InfotainmentSupplier = SRC.InfotainmentSupplier
 ,DST.OperatingTermination = SRC.OperatingTermination
 ,DST.Flowtype = SRC.Flowtype
 ,DST.CountBus = SRC.CountBus
 ,DST.NewRealTime = SRC.NewRealTime
 ,DST.SupplierRealTime = SRC.SupplierRealTime
 ,DST.LastModified = SRC.LastModified
 ,DST.GarageRef = SRC.GarageRef
 ,DST.GarageAddress = SRC.GarageAddress
 ,DST.ContractorRef = SRC.ContractorRef
 ;
end

GO

