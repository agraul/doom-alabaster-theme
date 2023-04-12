import collections
import logging, re

LOG = logging.getLogger()


class C(collections.Reversible):
    """Dummy class.

    with a multiline docstring.
    """

    # comment
    a = None

    def __init__(self, arg: list):
        if arg is not None:
            self.b = arg
        self.s = "multiline\nstring"
        self.r = re.compile(f"regex")
        self.n = 100.000
        self.b = [True, False]

    @staticmethod
    def println(txt):
        print(f"C: {txt}")


def foo(a: C, b: str) -> tuple:
    a.println(b)
    return (a, b)
