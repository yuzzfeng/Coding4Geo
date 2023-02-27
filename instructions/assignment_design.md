# How to prepare a coding exercise - Coding4Geo

Authors: Yi Zhang, Xin Wang


### Dependencies installed already

```
!pip install numpy
!pip install opencv-contrib-python-headless==4.7.0.68
!pip install matplotlib
!pip install scikit-image
```
### Task Design

Usually an coding assignment contains several tasks. And it is beneficial to design the "coherent" tasks (for eample achieve a complex algorithm step by step), since it is much easier for student to understand the logic between tasks.

Here is an plain template of individual task:

### Task Template

Firstly, a task should have a Markdown block(cell) for task description and requirement.

#### Task (Index): (Title of the task)
(Berief description of the task)

Steps: (describe the step of this task in detail)
1. (step 1)
2. (step 2)
3. ...

Variables: (The variable asked for checking)
1. `(variable 1 name)` : (characterization of variable 1)
2. `(variable 2 name)` : (characterization of variable 2)
3. ..

Hints:
1. Function [(function 1 name)]() to (desciption of function 1)
2. Function [(function 1 name)]() to (desciption of function 2)
3. ..

Then it is followed by two python code block(cell). One is the solution block and the other one is test block.

Solution block: 

```
### BEGIN SOLUTION
    
### END SOLUTION
```

Test block:
```
### BEGIN HIDDEN TESTS

### END HIDDEN TESTS
```

And here is a live example of individual task:

#### Task Live Example
### Task 1: Load and Show Image, change Colorspaces
In this task you will learn how to load an image from disk.

Steps:
1. load a color image named "examples/image.jpg" from local working directory 

Variables:
1. `I` : loaded BGR image

Hints:
1. Function [cv.imread](https://opencv24-python-tutorials.readthedocs.io/en/latest/py_tutorials/py_gui/py_image_display/py_image_display.html) to load image

```
### BEGIN SOLUTION

I = cv.imread("example/image.jpg",cv.IMREAD_COLOR)

### END SOLUTION

plt.imshow(I)
plt.title('src img')
plt.show()
```
```
### BEGIN HIDDEN TESTS
I_test = cv.imread("example/image.jpg",cv.IMREAD_COLOR)

try: 
   assert (I == I_test).all()
except: 
   print("[Error] Loaded image is not correct.")
## END HIDDEN TESTS
```

#### Test Code

One sufficient way to make test code is use `assert`
keyword and Exception Handling including `try` and  `except`. In the previous example,

```
### BEGIN HIDDEN TESTS
I_test = cv.imread("example/image.jpg",cv.IMREAD_COLOR)

try: 
   assert (I == I_test).all()
except: 
   print("[Error] Loaded image is not correct.")
## END HIDDEN TESTS
```

At first we should create correct answer in order to make comparison. In this part you can just implement the solution code using different variables. (like what we do in the example) Or you can use constant value or load value from self defined data files.

Then we use assert to test if the condition is true. In this example, the condition is `I == I_test`. Notice that for comparsion between ndarrays, `.all()` can be helpful.

Finally, we use `try` and `except` block to handle the wrong solution. If the condition returns false, it will run the code in `except` block, where you can implement some hint code to tell students about the mistakes.

#### Note
Notice that if we only implement assert without Exception Handling, the python Interpreter will automatically call `traceback.print_exc()` and students can see the details of your test code.
