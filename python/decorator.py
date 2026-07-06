

# A decorator is simply a function that takes another function as an argument and returns a new, modified function.
def simple_decorator(func):
    def wrapper():
        print("before function is called")
        func()
        print("after function is called")
    return wrapper


@simple_decorator
def simple_function():
    print("hello from function")


simple_function()
