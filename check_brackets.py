import sys

def check(file):
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    stack = []
    pairs = {'{': '}', '[': ']', '(': ')', '<': '>'}
    
    for i, char in enumerate(content):
        # Very basic check, won't handle strings/JSX correctly, but good for simple brace matching
        if char in pairs.keys():
            stack.append((char, i))
        elif char in pairs.values():
            if not stack:
                print(f"Unmatched {char} at {i}")
                return
            top, pos = stack.pop()
            if pairs[top] != char:
                print(f"Mismatched {char} at {i}. Expected {pairs[top]} from {pos}")
                return
    if stack:
        print(f"Unclosed {stack[-1][0]} from {stack[-1][1]}")
    else:
        print("Braces seem balanced (naive check)")

check("dashboard.html")
