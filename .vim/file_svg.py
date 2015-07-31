from file_base import FileBase

new = lambda: FileSvg()

class FileSvg(FileBase):

	def __init__(self):
		self._comment = "#"
		self._indent_char = ":"
		self._base = super(FileSvg, self)

	def run(self):
		self.command("!open %")
