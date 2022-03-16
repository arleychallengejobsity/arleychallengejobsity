
--CREATE [dbo].[EXECUTION_LOGS] TABLE
DROP TABLE IF EXISTS [dbo].[trips]
GO
CREATE TABLE [dbo].[trips](
	[region] [varchar](50) NULL,
	[datetime] [datetime] NULL,
	[datasource] [varchar](50) NULL,
	[origin_lat] [numeric](30, 15) NULL,
	[origin_long] [numeric](30, 15) NULL,
	[destination_lat] [numeric](30, 15) NULL,
	[destination_long] [numeric](30, 15) NULL,
	[distance_km] [numeric](30, 15) NULL,
	[weekofyear] [varchar](50) NULL,
	[tripsaverage_per_week] [int] NULL
) ON [PRIMARY]
GO


--CREATE [dbo].[EXECUTION_LOGS] TABLE

DROP TABLE IF EXISTS  [dbo].[EXECUTION_LOGS]
GO
CREATE TABLE [dbo].[EXECUTION_LOGS](
	[ID_EXECUTION_LOG] [bigint] IDENTITY(1,1) NOT NULL,
	[SOURCE] [varchar](255) NULL,
	[TASK] [varchar](255) NULL,
	[LOGGING] [varchar](max) NULL,
	[EXECUTION_STARTTIME] [datetime] NULL,
	[EXECUTION_ENDTIME] [datetime] NULL,
	[DURATION] [datetime] NULL,
 CONSTRAINT [ix_EXECUTION_LOGS] UNIQUE NONCLUSTERED 
(
	[TASK] ASC,
	[EXECUTION_STARTTIME] ASC,
	[EXECUTION_ENDTIME] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--Bonus features
--1 - From the two most commonly appearing regions, which is the latest datasource?
select top 1 datasource,datetime from trips A
inner join 
(
--count regions and order to get the two most commonly regions
select top 2 region,count(0) cont from dbo.trips 
group by region order by 2 desc) B on
A.region = B.region
order by datetime desc

--2 What regions has the "cheap_mobile" datasource appeared in?
select distinct region from dbo.trips
where datasource = 'cheap_mobile'