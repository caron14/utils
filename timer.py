"""
Timer utility

Measure the execution time of a function,
which is specified by decorator(@timer).
"""
import time

def timer(func):
    """
    Measure the execution time of a function.

    Examples
    --------
    @timer
    >> def func(*args, **kwargs):
    >>     ***
    ..
    >> f"{func.__name__} took {after-before:.2f} sec"
    --------

    :param func: Any function you would like to measure time
    :return: inner function object(for decorator)
    """
    def inner(*args, **kwargs):
        before = time.time()
        func(*args, **kwargs)
        after = time.time()
        print(f"{func.__name__} took {after-before:.2f} sec")
    return inner


"""test code"""
# @timer
# def test_func(sec):
#     print(f"Process starts..")
#     time.sleep(sec)
#     print(f"Process ends..")
#
# test_func(5)
"""
ideal output
------------
>> test_func took 5.01 sec
"""