from file_base import FileBase

import sys
import os

new = lambda: FileSh()

class FileSh(FileBase):

	def __init__(self):
		self._base = super(FileSh, self)
		self._comment = "#"

	def run(self):
		if self._base.run():
			return
		self.command("!source %")

