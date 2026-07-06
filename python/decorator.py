

# A decorator is simply a function that takes another function as an argument and returns a new, modified function.
def simple_decorator(func):
    def wrapper():
        print("before function is called this line is coming from decorator function")
        func()
        print("after function is calledthis line is coming from decorator function")
    return wrapper


@simple_decorator
def simple_function():
    print("hello from function")


simple_function()
