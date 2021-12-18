%Transient Solution
%Create a transient thermal model for solving an rectangle domain problem.

thermalModelT = createpde('thermal','transient');
recty=[0.0 1.0 1.0 0.0]; % x coordinates of 4 corners of rect.
rectx=[0.0 0.0 4.0 4.0]; % y coordinates of 4 corners of rect.
g = decsg([3,4,rectx,recty]'); 
geometryFromEdges(thermalModelT,g);
msh = generateMesh(thermalModelT);
figure(1)
subplot(2,2,1)
pdeplot(thermalModelT)
axis equal

thermalModelT.Mesh = msh;

%Specify the thermal conductivity, mass density, and specific heat of the material.
%The rod is composed of a material with these thermal properties.

k = 21.2; % Thermal conductivity, W/(m*K)
rho = 2300; % Density, kg/m^3
cp = 712; % Specific heat, W*s/(kg*K)
q = 0; % Heat source, W/m^3

thermalProperties(thermalModelT,'ThermalConductivity',k,...
                                'MassDensity',rho,...
                                'SpecificHeat',cp);

%Specify the internal heat source and boundary conditions
%internalHeatSource(thermalModelT,q);

thermalBC(thermalModelT,'Edge',3,'Temperature',0);
thermalBC(thermalModelT,'Edge',1,'HeatFlux',1.0);

%Specify that the Initial temperature in the rectangular is 0

thermalIC(thermalModelT,0);

%Compute the transient solution for solution times from t = 0 to t = 50000 seconds.
days=30;
tfinal = days*24*60*60;
dt=6*60*60;
tlist = 0:dt:tfinal;
dlist=tlist/(24*60*60);
result = solve(thermalModelT,tlist);

%Find the temperature at the bottom surface of the rod: first, at the center axis and then on the outer surface.
Tsensor1 = interpolateTemperature(result,[4-1.332;0.5],1:numel(tlist));
Tsensor2 = interpolateTemperature(result,[4-0.676;0.5],1:numel(tlist));

%Plot the temperature distribution at t = t_end seconds.

T = result.Temperature;


subplot(2,2,2)
pdeplot(thermalModelT,'XYData',T(:,end),'Contour','on')
axis equal
title(sprintf('Transient Temperature at Final Time (%g days)',days))

%Plot the temperature at the left end of the rod as a function of time. The outer surface of the rod is exposed to the environment with a constant temperature of 100 °C. When the surface temperature of the rod is less than 100 °C, the environment heats the rod. The outer surface is slightly warmer than the inner axis. When the surface temperature is greater than 100 °C, the environment cools the rod. The outer surface becomes cooler than the interior of the rod.

subplot(2,2,3)
plot(dlist,(Tsensor1),dlist,Tsensor2);
title 'unit step response'
xlabel 'Time, days'
ylabel 'Temperature, C'

legend('sensor1','sensor2','Location','SouthEast')

subplot(2,2,4)
dT1=[diff(Tsensor1),0]/dt;
dT2=[diff(Tsensor2),0]/dt;
plot(dlist,dT1,dlist,dT2)
title 'Impulse response '
xlabel 'Time, days'
ylabel 'Temperature, C'


IRdata=[dlist',dT1',dT2'];
save 'impluse_response.dat' IRdata -ascii
