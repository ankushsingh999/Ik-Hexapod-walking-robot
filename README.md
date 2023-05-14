# Inverse Kinematics of a Hexapod Walking Robot

Considered a hexapod walking robot with the schematic shown. Used the exact same x-y direction, leg configuration, leg numbering, and values for the leg segments. Considered a base frame located on the ground (X-Y-Z) and a local frame located in the middle of the top platform (x-y-z). Assume that the hip joints are evenly distributed around the top platform with angle of 60 degrees (radially symmetric) as shown. Let 𝑠⃗𝑖 be the distance vector from the origin of the local frame to the ith hip joint on the top platform where 𝑖 = 1, ..., 6. Let 𝑢⃗⃗𝑖 be the distance vector from the origin of the base frame to the ith foot tip on the ground. Define vector 𝑂⃗⃗ = [𝑥, 𝑦, 𝑧]𝑇 mm connecting the origin of the base frame to the origin of the local frame. 

![image](https://github.com/ankushsingh999/Ik-Hexapod-walking-robot/assets/64325043/957624b5-226e-4f8e-8ed0-e68ed9eeddf3)

![image](https://github.com/ankushsingh999/Ik-Hexapod-walking-robot/assets/64325043/0f1bf34d-4936-42ca-81da-fbf602b3d850)


Defined 𝛼⃗ = [𝑎, 𝑏, 𝑐]𝑇 as the vector of Euler angles representing the rotation (orientation) of the local frame w.r.t. the base frame. Assume that the feet are evenly distributed and located on a circle on the ground with a diameter of 480 mm. The diameter of the top platform is 300 mm. For the given pose 𝑃 = [𝑥, 𝑦, 𝑧, 𝑎, 𝑏, 𝑐]𝑇 = [0,10,100,5,5,0]𝑇, calculated the 18 joint angles if 𝛼 represents XYZ Euler angles in degrees.

# Results

![image](https://github.com/ankushsingh999/Ik-Hexapod-walking-robot/assets/64325043/8710e917-b63c-4da4-b1ea-cc3ce127929e)

The results are validates by checking if the values lie in the range defined in the table below:

![image](https://github.com/ankushsingh999/Ik-Hexapod-walking-robot/assets/64325043/562329c9-b1e5-4a27-a8f1-c0879edf8071)


***Feel free to play with the robot configuration and pose according to your requirement***


