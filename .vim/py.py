# -*- coding: utf-8 -*-
try:
	import sys
	import os
	import imp
except:
	pass

_vim, _root, _filebase = None, None, None

def setup(vim, root):
	global _vim, _root, _filebase
	_vim = vim
	_root = root

def run(command):
	global _root
	_filebase = load("file_base")
	mode = load("file_" + get_file_suffix())
	if mode is None:
		return
	obj = mode.new()
	obj._root = _root
	obj.__getattribute__(command)()

def load(mod):
	name = '%s/%s.py' % (_root, mod)
	try:
		return imp.load_source(mod, name)
	except IOError, e:
		mod = "base"
		name = "%s/file_%s.py" % (_root, mod)
		return imp.load_source(mod, name)

def get_current_path():
	return _vim.current.buffer.name

def get_file_suffix():
	data = _vim.current.buffer.name
	idx = data.rfind('/')
	if idx > 0:
		data = data[idx+1:]
	idx = data.rfind('.')
	if idx >= 0:
		data = data[idx+1:]
	return data
