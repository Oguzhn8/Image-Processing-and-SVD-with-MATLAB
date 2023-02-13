# Singular Value Decomposition with Python and MATLAB
Singular Value Decomposition (SVD) is used widely in signal processing. Noise reduction and image compression are some of the applications of SVD.To give the formula as a starting point, the SVD structure is as follows: </br>
![image](https://user-images.githubusercontent.com/78887209/218332729-a7785950-e74a-4ca9-abfe-39a54d40b348.png) </br>
A is an m x n matrix you originally have either from an image or some other data source. U and V are orthogonal matrices and Σ is a diagonal matrix.  To understand this structure; Its meaning will be explained later.
## Introduction
Considering that there is an image similar to the following image in 5 x 5 grayscale: </br>
![image](https://user-images.githubusercontent.com/78887209/218332798-874b7b1e-28b7-478b-b628-1c46124c7f9e.png) </br>
The matrix representing the image is as follows: </br>
array([[255, 255, 2, 2, 2], </br>
       [255, 255, 3, 5, 10], </br>
       [4, 4, 255, 253, 255], </br>
       [3, 2, 255, 255, 255], </br>
       [1, 3, 255, 255, 254]]) </br>
And here is the calculated U matrix: </br>
U = </br>
array([[-0.01,  0.70,  0.67, -0.19, 0.02] </br>
[-0.02,  0.70, -0.67,  0.19, -0.03] </br>
[-0.57, -0.01, -0.16, -0.48,  0.63] </br>
[-0.57, -0.02, -0.04, -0.29, -0.75] </br>
[-0.57, -0.02,  0.21,  0.77,  0.12]]) </br>
Imagine the columns of U as concepts and the rows of U as the relationships between the rows of A and those concepts. For example, in this picture it is stated that there are two concepts: </br>
1 - Black -> White </br>
2 - White -> Black </br>
Since the greater values only appear in the last three columns, which all begin with black and end with white, the first column of U is for the first notion. For the same reason, the second column of U is for the second notion. Σ values are as below: </br>
array([[764.29, 0, 0, 0, 0] </br>
    [0, 509.74, 0, 0, 0] </br>
    [0, 0, 3.72, 0, 0] </br>
    [ 0, 0, 0, 1.62, 0] </br>
    [0, 0, 0, 0, 1.21]] </br>
Σ values can be expressed as the magnitude of concepts. This matrix shows that the first two concepts are the most important, which means that the other concepts are just noise. This noise part will be covered later. Finally the V values: </br>
array([[-0.02, -0.02, -0.57, -0.57, -0.57] </br>
 [0.70,  0.70, -0.02, -0.01, -0.01] </br>
[-0.06,  0.07,  0.53,  0.26, -0.79] </br>
[-0.56,  0.56, -0.40,  0.43, -0.03] </br>
[-0.41,  0.41,  0.46, -0.64,  0.17]] </br>
V values can be thought of as similar to U but this time for columns of A instead of rows. So each row of V represents a concept, and the columns of V are the relationships between the columns of A and the concepts. In this example, you can easily see the last 3 columns of A belong to the 1st concept and first 2 columns of A belong to the 2nd concept.
## Image compression using SVD
Each element of an image is represented as the pixel's grayscale value in a rectangular array. We have a 3-dimensional array of size nxmx3 for colored images, where n and m stand for the number of pixels vertically and horizontally, respectively, and we record the intensity of the red, green, and blue colors for each pixel. In image compression with SVD, a low-order approximation of a matrix is created that represents an image for each color separately. The resulting 3D array will be a good approximation of the original image. </br>
### Exercise 1
1 - NASA photo (TarantulaNebula.jpg) comes from the Hubble telescope and presents a dramatic picture of this extra-galactic formation. Download it </br>
2 - Python has several image manipulation helper libraries. In this study, matplotlib library will be used. In this case, read the image in using the following command: </br>
![image](https://user-images.githubusercontent.com/78887209/218455397-85be1ded-2edb-4223-81b5-674e3fa4791e.png)  </br>
The variable nasacolor will be a 567x630x3 matrix of integer values between 0 and 255. Display the color plot using the command: </br>
![image](https://user-images.githubusercontent.com/78887209/218455548-18794662-191b-4014-9f22-ef4c8ca0ed92.png) </br>
The output of the command is as follows: </br>
![image](https://user-images.githubusercontent.com/78887209/218455719-ee3b7782-acf8-496d-b556-71efa1ed3540.png) </br>
The third subscript of the array nasa refers to the red, green, and blue color components. To simplify this exercise, turn it into a greyscale with ordinary double precision values 0-255 using the following commands: </br>
![image](https://user-images.githubusercontent.com/78887209/218456277-b4d26013-a438-4dba-9d66-e7f65a1a14f6.png) </br>
The result from these commands is that nasa is an ordinary 567x630 array of double precision numbers. Python has the notion of a ``colormap'' that determines how the values in the matrix will be colored. Use the command when the plot the new image:  </br>
![image](https://user-images.githubusercontent.com/78887209/218456724-eb985d8b-c542-4c0f-a82f-467011594289.png) </br>
The output of the command is as follows: </br>
![image](https://user-images.githubusercontent.com/78887209/218457000-23489578-0966-49e8-82c5-341cfe752252.png) </br>
#### Perform Singular Value Decomposition
The following command is used to perform the SVD: </br>
![image](https://user-images.githubusercontent.com/78887209/218457833-cf8fd446-29f8-49ff-ab79-7fcf9cd25ae6.png) </br>
The following command is used to plot singular values on a semilog scale: </br>
![image](https://user-images.githubusercontent.com/78887209/218460286-fe7240c2-d6e6-4df1-af70-1fe63209f65c.png) </br>
Output: </br>
![svd_plot](https://user-images.githubusercontent.com/78887209/218460443-bc6fb22e-6051-479b-9e9e-a0d6057501bc.png) </br>
Values of less than 50 are observed to drop below 2% of the maximum very quickly. Construct the three new matrices with the following commands: </br>
![image](https://user-images.githubusercontent.com/78887209/218498084-3d86efba-73df-4005-b2f7-39eb2cbd5f59.png) </br>
You can observe the outputs for different versions below: </br>
![image](https://user-images.githubusercontent.com/78887209/218498313-b42c94fb-51d1-403a-bf8d-7c8050dec369.png)
![image](https://user-images.githubusercontent.com/78887209/218498409-828995f4-5345-44be-bca4-604a531523ae.png)
![image](https://user-images.githubusercontent.com/78887209/218498530-0ced8a25-9d24-46df-8cc7-2ceed3b00daf.png) </br>
These matrices are of lower rank than the nasa matrix, and can be stored in a more efficient manner. (The nasa matrix is 567x630 and requires 357,210 numbers to store it. In contrast, nasa50 requires subsets of U and V that are 567x50 and the diagonal of S, for a total of 56,750. This is better than four to one savings in space.) The higher the singular value in reconstruction, the better the quality of the approach, but also the more data is needed to encode it. There are very small differences between the original and the one with 100 singular values, some noticeable differences with 50 singular values, while in the case of 25 singular values the image is severely degraded. </br>
SVD is routinely used in statistics for principal component analysis and in numerical simulations for reducing the order of models. For image compression, more sophisticated methods like JPG that take human perception into account generally outperform compression using SVD.
## Further Readings
http://timbaumann.info/svd-image-compression-demo/  </br>
https://machinelearningmastery.com/singular-value-decomposition-for-machine-learning/  </br>
https://www.section.io/engineering-education/singular-value-decomposition-in-python/





