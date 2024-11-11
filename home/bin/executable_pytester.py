#!/usr/bin/env python

import argparse
import os
import pathlib
import sys


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('symbols', type=argparse.FileType('r'))

    args = parser.parse_args()

    symbols = args.symbols.read()
    try:
        symbols = symbols.strip()
        symbols = symbols.split("\n")
        expressions = " and ".join(symbols)
        if expressions:
            print(f"-k \"{expressions}\"")
        else:
            print("")
    finally:
        args.symbols.close()


if __name__ == "__main__":
    try:
        main()
        sys.stdout.flush()
    except BrokenPipeError:
        devnull = os.open(os.devnull, os.O_WRONLY)
        os.dup2(devnull, sys.stdout.fileno())
        sys.exit(1)
