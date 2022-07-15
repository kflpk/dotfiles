#!/bin/python3

from argparse import _StoreFalseAction
import argparse
import tkinter
import notify2
from sys import stdin
from googletrans import Translator

parser = argparse.ArgumentParser(description="Parse stuff")

parser.add_argument('--from', metavar='LANG',   type=str, 
                    help='Language to translate from', default='en', dest='_src')
parser.add_argument('--to',   metavar='LANG',   type=str, 
                    help='Language to translate to',   default='pl', dest='_dest')
parser.add_argument('--src',  metavar='SOURCE', type=str, 
                    help='Source of content to translate; `primary` or `stdin`', default='primary')
parser.add_argument('--out',  metavar='OUTPUT', type=str, 
                    help='`stdout` or `notify`', default='notify')

args = parser.parse_args()

if args.src == 'primary':
    root = tkinter.Tk()
    word = root.selection_get(selection="PRIMARY")
elif args.src == 'stdin':
    word = stdin.read()

translator = Translator(service_urls=['translate.googleapis.com'])
output = translator.translate(word, src=args._src, dest=args._dest).text

if args.out == 'notify':
    notify2.init("Translate")
    notification = notify2.Notification("Translated \"{word}\"".format(word = word),
                                        "\"{out}\"".format(out=output))
    notification.set_timeout(1000)
    notification.show()
elif args.out == 'stdout':
    print(output)

