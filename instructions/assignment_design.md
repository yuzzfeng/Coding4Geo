# How to prepare a coding exercise - Coding4Geo

Authors: Yi Zhang, Xin Wang


## 1. Dependencies installed already
Before solving the problem in the homework, the students should install necessary dependencies in the jupytor notebook environment. For example, `OpenCV` is a popular dependency of computer vision homework. To ensure that, a install code block can be placed in the front of the task. The following code shows how we do it in Coding4Geo:

```
!pip install numpy
!pip install opencv-contrib-python-headless==4.7.0.68
!pip install matplotlib
!pip install scikit-image
```
## 2. Task Description

Usually an coding assignment contains several tasks. And it is beneficial to Description the "coherent" tasks (for eample achieve a complex algorithm step by step), since it is much easier for student to understand the logic between tasks. Here is a example of task description:

### 2.1 Example
In this task you will write a function to read one image and return three objects, namely the original image in BGR color scale, the gray value image, and the image in RGB color scale:

Steps:
1. load a color image named "examples/image.jpg" from local working directory as BGR color-space
2. convert color-space BGR to Gray, and save the image as "gray.jpg"
3. convert color-space BGR to RGB

Variables:
1. `I` : loaded BGR image
2. `I_gray` : grayscale image
3. `I_RGB` : RGB image

Hints:
1. Function [cv.imread] to load image
2. Function [cv.cvtColor] to covert color by using different flags
3. Function [cv.imwrite] to save image

Notice that there is usually four parts, text description, steps, variables and hints.

### 2.2 text description
This part tell the student the content and purpose of the task.  

### 2.3 steps
In this part student can learn how to solve the task step by step. And it is also easier to evaluate the students solution if they are told how to do in detail.

### 2.4 variables
This part tells the students explicitly which variables should be defined and their functions.

### 2.5 hints
This part can let student know which API can they use.

## 3. Task Solution
After the description is the solution block. Of course the sample solution should be designed at first in order to design proper test code. Notice that the sample solution should be written between comments in the blocks like:
```
### BEGIN SOLUTION
    
### END SOLUTION
```
Then the nbgrader can remove it when releasing the assignment. Here is an example of solution block:
```
### BEGIN SOLUTION

I = cv.imread("example/image.jpg",cv.IMREAD_COLOR)

### END SOLUTION

plt.imshow(I)
plt.title('src img')
plt.show()
```
## 4. Test code
The last part of a task is the test code. The test code includes `public test` and `private test`. The `private test` is the test code that you don't want to show the students (could be solution related) and should be written between comments in the blocks like:
```
### BEGIN HIDDEN TESTS

## END HIDDEN TESTS
```
Then the nbgrader can remove it when releasing the assignment. One sufficient way to design test code is define functions. For example, `public_test()` for public test and `private_test()` for private test. Here is an example of test block:

```
def public_test():
     try:
          I
     except NameError:
          print("[Error] Variable I is not defined.")
          return False
     return True

assert public_test()

### BEGIN HIDDEN TESTS
I_test = cv.imread("example/image.jpg",cv.IMREAD_COLOR)

def private_test():
     try: 
          assert (I == I_test).all()
     except: 
          print("[Error] Loaded image is not correct.")
          return False
     return True
     
assert private_test()
## END HIDDEN TESTS
```

Every single point that is checked in the test function is bounded by a `try-except` block. Here are some typical test block that you may use:

### 4.1 variable existence check
Remember that in the task description we have required that which variables should be defined. This block is to ensure that the variable exits. Student can not pass the task without definine asked variables.
```
try:
     var
except NameError:
     print("[Error] Variable var is not defined.")
     return False
```

### 4.2 channel check
This block checks wether the matrix `img` is grayscale or not. If you want to check color channel, the number should be 3.
```
try:
     assert len(img.shape) == 2
except:
     print("[Error] The channel of img is wrong.")
     return False
```

### 4.3 shape check
This block checks the shape of matrix `img`.
```
try:
     assert img.shape == (240,360)
except:
     print("[Error] The shape of img is wrong.")
     return False
```
### 4.4 value check
You can check the pixel value of img like:
```
 try:
     assert (img[120,300] == [222, 152, 127]).all()
except:
     print(f"[Error] The value of pixel (120,300) isn't correct. Expected: [222, 152, 127], but got {img[120,300]}")
     return False
```
or the value of whole matrix like:
```
try: 
     assert (img==result).all()
except: 
     print("[Error] The result seems to be different. Try again with correct parameters.") 
     return False
```