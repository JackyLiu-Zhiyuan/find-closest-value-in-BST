from collections import deque
def findClosestValueInBst(tree, target):
    nodes = deque()
    nodes.append(tree)
    min_diff =float("inf")
    min_val = tree.value
    while len(nodes):
        print(nodes)
        current = nodes.popleft()
        current_diff = current.value - target
        if current_diff == 0:
            return current.value
        elif current_diff > 0 and current.left:
            if current_diff < min_diff:
                min_diff = current_diff
                min_val = current.value
            nodes.append(current.left)
        elif current_diff < 0 and current.right:
            nodes.append(current.right.value)
            if current_diff > min_diff:
                min_diff = current_diff
                min_val = current.value
            nodes.append(current.right)

    return min_val

class BST:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

a = BST(10)
b = BST(5)
c = BST(7)
a.left = b
a.right = c

print(findClosestValueInBst(a, 7))









