from file_base import FileBase

import sys
import os

new = lambda: FilePhp()

class FilePhp(FileBase):

	def __init__(self):
		self._base = super(FilePhp, self)

	def run(self):
		if self._base.run():
			return
		self.command("!php %")

