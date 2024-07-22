

create function [data].[UF_utm_to_lat](@utmz decimal(24, 12), @x decimal(24, 12), @y decimal(24, 12)) returns decimal(24, 12)
as
begin
    --Based on code from this page: http://www.uwgb.edu/dutchs/usefuldata/ConvertUTMNoOZ.HTM
    declare @latitude decimal(24, 12);
    declare @longitude decimal(24, 12);
    set @latitude = 0.00;
    set @longitude = 0.00;

    --Declarations
    declare @a decimal(24, 12);
    declare @f decimal(24, 12);
    declare @drad decimal(24, 12);
    declare @k0 decimal(24, 12);
    declare @b decimal(24, 12);
    declare @e decimal(24, 12);
    declare @e0 decimal(24, 12);
    declare @esq decimal(24, 12);
    declare @e0sq decimal(24, 12);
    declare @zcm decimal(24, 12);
    declare @e1 decimal(24, 12);
    declare @M decimal(24, 12);
    declare @mu decimal(24, 12);
    declare @phi1 decimal(24, 12);
    declare @C1 decimal(24, 12);
    declare @T1 decimal(24, 12);
    declare @N1 decimal(24, 12);
    declare @R1 decimal(24, 12);
    declare @D decimal(24, 12);
    declare @phi decimal(24, 12);
    declare @lng decimal(24, 12);
    declare @lngd decimal(24, 12);

    --Datum Info here: Name, a, b, f, 1/f
    --WGS 84    6,378,137.0 6356752.314 0.003352811 298.2572236

    set @a = 6378137.0;
    set @b = 6356752.314;
    set @f = 0.003352811;
    set @drad = PI()/180.0;
    set @k0 = 0.9996; --scale on central meridian

    set @e = sqrt(1.0 - (@b/@a)*(@b/@a)); --Eccentricity
    --e = Math.sqrt(1 - (b/a)*(b/a));//eccentricity
    set @e0 = @e/sqrt(1.0 - @e*@e); --Called e prime in reference
    --e0 = e/Math.sqrt(1 - e*e);//Called e prime in reference
    set @esq = (1.0 - (@b/@a)*(@b/@a)); --e squared for use in expansions
    --esq = (1 - (b/a)*(b/a));//e squared for use in expansions
    set @e0sq = @e*@e/(1.0-@e*@e); --e0 squared - always even powers
    --e0sq = e*e/(1-e*e);// e0 squared - always even powers
    set @zcm = 3.0 + 6.0*(@utmz-1.0) - 180.0; --Central meridian of zone
    --zcm = 3 + 6*(utmz-1) - 180;//Central meridian of zone
    set @e1 = (1.0 - sqrt(1.0 - @e*@e))/(1.0 + sqrt(1.0 - @e*@e)); --Called e1 in USGS PP 1395 also
    --e1 = (1 - Math.sqrt(1 - e*e))/(1 + Math.sqrt(1 - e*e));//Called e1 in USGS PP 1395 also
    set @M = 0.0 + @y / @k0; --Arc length along standard meridian
    --M = M0 + y/k0;//Arc length along standard meridian. 
    set @mu = @M/(@a*(1.0 - @esq*(1.0/4.0 + @esq*(3.0/64.0 + 5.0*@esq/256.0))));
    --mu = M/(a*(1 - esq*(1/4 + esq*(3/64 + 5*esq/256))));
    set @phi1 = @mu + @e1*(3.0/2.0 - 27.0*@e1*@e1/32.0)*sin(2.0*@mu) + @e1*@e1*(21.0/16.0 - 55.0*@e1*@e1/32.0)*sin(4.0*@mu); --Footprint Latitude
    --phi1 = mu + e1*(3/2 - 27*e1*e1/32)*Math.sin(2*mu) + e1*e1*(21/16 -55*e1*e1/32)*Math.sin(4*mu);//Footprint Latitude
    set @phi1 = @phi1 + @e1*@e1*@e1*(sin(6.0*@mu)*151.0/96.0 + @e1*sin(8.0*@mu)*1097.0/512.0);
    --phi1 = phi1 + e1*e1*e1*(Math.sin(6*mu)*151/96 + e1*Math.sin(8*mu)*1097/512);
    set @C1 = @e0sq*power(cos(@phi1),2.0);
    --C1 = e0sq*Math.pow(Math.cos(phi1),2);
    set @T1 = power(tan(@phi1),2.0);
    --T1 = Math.pow(Math.tan(phi1),2);
    set @N1 = @a/sqrt(1.0-power(@e*sin(@phi1),2.0));
    --N1 = a/Math.sqrt(1-Math.pow(e*Math.sin(phi1),2));
    set @R1 = @N1*(1.0-@e*@e)/(1.0-power(@e*sin(@phi1),2.0));
    --R1 = N1*(1-e*e)/(1-Math.pow(e*Math.sin(phi1),2));
    set @D = (@x-500000.0)/(@N1*@k0);
    --D = (x-500000)/(N1*k0);
    set @phi = (@D*@D)*(1.0/2.0 - @D*@D*(5.0 + 3.0*@T1 + 10.0*@C1 - 4.0*@C1*@C1 - 9.0*@e0sq)/24.0);
    --phi = (D*D)*(1/2 - D*D*(5 + 3*T1 + 10*C1 - 4*C1*C1 - 9*e0sq)/24);
    set @phi = @phi + power(@D,6.0)*(61.0 + 90.0*@T1 + 298.0*@C1 + 45.0*@T1*@T1 - 252.0*@e0sq - 3.0*@C1*@C1)/720.0;
    --phi = phi + Math.pow(D,6)*(61 + 90*T1 + 298*C1 + 45*T1*T1 -252*e0sq - 3*C1*C1)/720;
    set @phi = @phi1 - (@N1*tan(@phi1)/@R1)*@phi;
    --phi = phi1 - (N1*Math.tan(phi1)/R1)*phi;


    set @latitude = @phi/@drad--floor(1000000.0*@phi/@drad)/1000000.0;

    set @lng = @D*(1.0 + @D*@D*((-1.0 - 2.0*@T1 - @C1)/6.0 + @D*@D*(5.0 - 2.0*@C1 + 28.0*@T1 - 3.0*@C1*@C1 + 8.0*@e0sq + 24.0*@T1*@T1)/120))/cos(@phi1);
    set @lngd = @zcm+@lng/@drad;
    set @longitude = @lngd--floor(1000000.0*@lngd)/1000000.0;


    return @latitude;
end

GO

