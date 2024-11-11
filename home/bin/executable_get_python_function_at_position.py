#!/usr/bin/env python

import argparse
import ast
import pathlib


def find_definition(fp, line):
    symbols = {}
    with fp.open() as fh:
        tree = ast.parse(fh.read())

        for node in ast.walk(tree):
            if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef, ast.ClassDef)):
                start, end = compute_size(node)
                symbols[node.name] = (start, end)

    matches = []
    for key, (start, end) in symbols.items():
        if start <= line <= end:
            matches.append(key)

    return matches


def compute_size(node):
    min_lineno = node.lineno
    max_lineno = node.lineno
    for node in ast.walk(node):
        if hasattr(node, "lineno"):
            min_lineno = min(min_lineno, node.lineno)
            max_lineno = max(max_lineno, node.lineno)
    return (min_lineno, max_lineno + 1)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('filepath', type=pathlib.Path)
    parser.add_argument('line', type=int)

    args = parser.parse_args()

    symbols = find_definition(args.filepath, args.line)
    for symbol in symbols:
        print(symbol)
