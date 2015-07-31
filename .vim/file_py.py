from file_base import FileBase

new = lambda: FilePy()

class FilePy(FileBase):

	def __init__(self):
		self._comment = "#"
		self._indent_char = ":"
		self._base = super(FilePy, self)

	def run(self):
		if super(FilePy, self).run():
			return
		self.command("!python %")
