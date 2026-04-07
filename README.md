# wing-cfd-analysis

✈️ Aerodynamic Design and CFD Analysis of a Fixed-Wing with Canted Winglets

📌 Overview
This project presents a complete aerodynamic design and analysis of a fixed-wing drone, including preliminary sizing, geometric modeling, and computational fluid dynamics (CFD) simulations. The objective is to evaluate the impact of canted winglets on aerodynamic performance and validate results using different modeling tools.

📐 Preliminary Design (MATLAB)
A constraint analysis was performed using MATLAB based on Raymer’s methodology to determine the optimal design point. The relationship between wing loading (W/S) and power loading (W/P) was evaluated under multiple performance constraints, including stall speed, maximum speed, takeoff distance, rate of climb, and service ceiling.
The feasible design region was identified, and an optimal configuration was selected. Based on this, the wing geometry was defined, and the S5010 airfoil was selected from the NASA database.

🛠️ Geometry & CFD Analysis (ANSYS)
-Geometry modeling and meshing were performed using ANSYS ICEM
-CFD simulations were conducted in ANSYS Fluent
-Two configurations were analyzed:
  1-Clean wing
  2-Wing with canted winglet

🔬 Comparative Study
A comparative analysis was performed to evaluate the impact of winglets on aerodynamic performance:
  -Lift coefficient (Cl)
  -Drag coefficient (Cd)
  -Aerodynamic efficiency (Cl/Cd)
The results show that the addition of canted winglets improves aerodynamic efficiency by reducing drag and enhancing lift characteristics.

🔁 Cross-Validation (OpenVSP)
The same configurations were modeled and analyzed using OpenVSP. A comparison between ANSYS Fluent and OpenVSP results showed consistent aerodynamic trends, confirming the reliability of the simulations and the validity of the design approach.

🧠 Conclusion
This project demonstrates a complete aerodynamic workflow from preliminary sizing to advanced CFD analysis. The results confirm the effectiveness of winglets in improving aerodynamic performance and highlight the importance of validation through multiple modeling approaches.
