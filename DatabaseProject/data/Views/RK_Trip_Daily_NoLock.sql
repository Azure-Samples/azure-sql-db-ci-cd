
CREATE VIEW [data].[RK_Trip_Daily_NoLock]
AS
SELECT        TripDate, TripStartTime, TripEndTime, TripPrice, TotalCount, YoungsterCount, AdultCount, ChildCount, BicycleCount, Handicap, DogCount, SeniorCount, ZoneCount, PaidZoneCount, DiscountLevel, StartStopPointId, 
                         StartStopPointName, EndStopPointId, EndStopPointName, SoloCombiTrip, CardType, Region, PtoCombination, RateSet, RateAreaCombination, ValidationModelCombination, ModalCombination, RouteCombination, TripRef
FROM            data.RK_Trip_Daily WITH (NOLOCK)

GO

