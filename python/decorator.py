

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


def log_decorator(func):
    def wrapper(*args, **kwargs):
        print(f"Calling {func.__name__} with arguments {args}")
        result = func(*args, **kwargs)
        print(f"{func.__name__} finished executing.")
        return result
    return wrapper


@log_decorator
def add_numbers(a, b):
    return a + b


print(add_numbers(5, 10))
