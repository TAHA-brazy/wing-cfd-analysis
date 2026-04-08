# wing-cfd-analysis

✈️ Aerodynamic Design and CFD Analysis of a Fixed-Wing with Canted Winglets

📌 Overview

This project presents a complete aerodynamic design and analysis of a fixed-wing drone, including preliminary sizing, geometric modeling, and computational fluid dynamics (CFD) simulations. The objective is to evaluate the impact of canted winglets on aerodynamic performance and validate results using different modeling tools.

📐 Preliminary Design (MATLAB)

A constraint analysis was performed using MATLAB based on Raymer’s methodology to determine the optimal design point. The relationship between wing loading (W/S) and power loading (W/P) was evaluated under multiple performance constraints, including stall speed, maximum speed, takeoff distance, rate of climb, and service ceiling.
The feasible design region was identified, and an optimal configuration was selected. Based on this, the wing geometry was defined, and the S5010 airfoil was selected from the NASA database.

![Constraint Analysis](images/constraint_analysis.png)

🛠️ Geometry & CFD Analysis (ANSYS)

-Geometry modeling and meshing were performed using ANSYS ICEM

![Wing](images/Wing.png)

![Mesh](images/mesh.png)


-CFD simulations were conducted in ANSYS Fluent

-Two configurations were analyzed:

  1-Clean wing
  
  2-Wing with canted winglet

🔬 Comparative Study

A comparative analysis was performed to evaluate the impact of winglets on aerodynamic performance. The results show that the addition of canted winglets improves aerodynamic efficiency by reducing drag and enhancing lift characteristics. A comparative analysis was performed to evaluate the impact of winglets on aerodynamic performance

📊 Aerodynamic Performance Curves

The variation of aerodynamic coefficients with angle of attack was analyzed for clean wing and wing with winglet using Excel:

-Lift coefficient (Cl) vs Angle of Attack

![cl](images/cl.png)

-Drag coefficient (Cd) vs Angle of Attack

![CD](images/CD.png)

-Aerodynamic efficiency (Cl/Cd) vs Angle of Attack

![f](images/f.png)

These results highlight the performance trends of both configurations and demonstrate the aerodynamic benefits of winglets across multiple operating conditions.

🔁 Cross-Validation (OpenVSP)

The same configurations were modeled and analyzed using OpenVSP. A comparison between ANSYS Fluent and OpenVSP results showed consistent aerodynamic trends, confirming the reliability of the simulations and the validity of the design approach.

🧠 Conclusion

A parametric analysis was conducted for angles of attack ranging from 2° to 8°. The results show consistent aerodynamic improvements with the integration of canted winglets across all tested conditions. At an angle of attack of 6°, the winglet configuration achieved a drag reduction of approximately 3% and a lift increase of about 8%, resulting in an overall efficiency improvement of around 11%.
The trends observed in lift, drag, and aerodynamic efficiency confirm the effectiveness of winglets in enhancing performance. Additionally, the agreement between ANSYS Fluent and OpenVSP results validates the reliability of the simulation approach.
