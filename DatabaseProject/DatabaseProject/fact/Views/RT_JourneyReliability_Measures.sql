


CREATE view [fact].[RT_JourneyReliability_Measures]

as

select	0.04 as [BunchingTarget],
		0.83 as [ReliableTargetACLines],
		0.85 as [ReliableTargetStrategicNet],
		0.85 as [ReliableTargetOtherLines]

GO

