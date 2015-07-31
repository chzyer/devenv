# -*- coding: utf-8 -*-
import vim
import re
import os

new = lambda: FileBase()

class FileBase(object):
	_comment = "#"
	_indent_char = "{"
	def get_current_path(self):
		return vim.current.buffer.name

	def addscore(self):
		self.set_current_line("%s %s" % (self._comment, "-"*(80-len(self._comment)-1)))

	def indent(self):
		line_no = vim.current.window.cursor[0]-1
		last_line = self.last_line(False)
		line = vim.current.buffer[line_no]
		old_indent_level = len(last_line) - len(last_line.lstrip())
		new_line = last_line[:old_indent_level]
		if len(last_line.strip()) > 0 and last_line.strip()[-1] == self._indent_char:
			new_line += "\t"
		if line == "":
			if new_line == "":
				new_line = "\t"
			if len(new_line) > 1:
				new_line = new_line[:-1]
			vim.current.buffer[line_no] = new_line
			self.press("A")
		elif line.strip() == "":
			vim.current.buffer[line_no] += "\t"
			self.press("A")
		else:
			start = vim.current.window.cursor[1]
			n = vim.current.buffer[line_no]
			if start == 0:
				vim.current.buffer[line_no] = "\t" + n
				self.press("a")
				return
			vim.current.buffer[line_no] = n[:start+1] + "\t" + n[start+1:]
			self.press("la")

	def get_file_name(self):
		name = vim.current.buffer.name
		idx = name.rfind("/")
		if idx > 0:
			name = name[idx+1:]
		return name

	def open_conf(self):
		name = self.get_file_name()
		idx = name.rfind('.')
		if idx >= 0:
			name = name[idx+1:]
		self.vs("%s/file_%s.py" % (self._root, name))

	def run(self):
		self.save()
		run_argv = self.findone(self._comment + r" run: (.*)")
		if run_argv is not None:
			self.command("!" + run_argv)
			return True
		return False

	def build(self):
		self.save()
		run_argv = self.findone(self._comment + r" build: (.*)")
		if run_argv is not None:
			self.command("!" + run_argv)
			return True
		return False

	def save(self):
		vim.command("w")

	def vs(self, path):
		vim.command("vs %s" % path)

	def command(self, w):
		vim.command(w)

	def buffer(self):
		return vim.current.buffer

	def findall(self, regex):
		r = re.compile(regex)
		for i in self.buffer():
			if r.match(i):
				return r.findall(i)
		return None

	def findone(self, regex):
		ret = self.findall(regex)
		if ret is None or len(ret) <= 0:
			return None
		return ret[0]

	def set_current_line(self, line):
		line_no = vim.current.window.cursor[0]
		vim.current.buffer[line_no - 1] = line

	def toggle_comment(self):
		buf = vim.current.line
		ch = self._comment

		if buf.strip()[:len(ch)] == ch:
			intentLength = buf.find(ch)
			self.set_current_line(buf[:intentLength] + buf.strip()[len(ch):].strip())
			return
	
		intentLength = buf.find(buf.strip())
		self.set_current_line("%s%s %s" % (buf[:intentLength], ch, buf[intentLength:]))

	def test_file(self):
		filename = self.get_file_name()
		idx = filename.find(".")
		if idx <= 0:
			print "not support for", filename
			return
		test_filename = filename[:idx] + "_test." + filename[idx+1:]
		self.command("vs " + test_filename)

	def press(self, key):
		self.command('''call feedkeys("%s")''' % key)

	def last_line(self, empty=True):
		line_no = vim.current.window.cursor[0]
		if empty:
			return vim.current.buffer[line_no-1-1]
		for i in range(line_no-1, -1, -1):
			if len(vim.current.buffer[i]) != 0:
				return vim.current.buffer[i]
		return ""

	def ensure_save(self):
		dirs = os.path.dirname(vim.current.buffer.name)
		if not os.path.exists(dirs):
			os.makedirs(dirs)
		os.chdir(dirs)
