from monte.runtime.base import MonteObject
from monte.runtime.data import Integer
from monte.runtime.flow import MonteIterator


class ConstList(tuple):
    def __repr__(self):
        orig = tuple.__repr__(self)
        return '[' + orig[1:-1] + ']'

    def __str__(self):
        return self.__repr__()

    def _makeIterator(self):
        return MonteIterator((Integer(i), o) for (i, o) in zip(range(len(self)), self))

    def size(self):
        return Integer(len(self))

    def get(self, index):
        if not isinstance(index, Integer):
            raise RuntimeError("Expected Integer, got %r" % index)
        return self[index.n]

    #XXX Is this a good name/API? no idea.
    def contains(self, item):
        return item in self

    def add(self, other):
        return ConstList(tuple(self) + tuple(other))

    def diverge(self):
        return FlexList(list(tuple(self)))


class FlexList(MonteObject):

    def __init__(self, l):
        self.l = l

    def push(self, value):
        self.l.append(value)

    def pop(self):
        return self.l.pop()

    def readOnly(self):
        return ConstList(self.l)

    def _makeIterator(self):
        return MonteIterator((Integer(i), o) for (i, o) in zip(range(len(self.l), self.l)))


def makeMonteList(*items):
    return ConstList(items)

class Map(dict):
    _m_fqn = "Dict"
    __setitem__ = None
    get = dict.__getitem__


class mapMaker(object):
    _m_fqn = "__makeMap"
    @staticmethod
    def fromPairs(pairs):
        return Map(pairs)
