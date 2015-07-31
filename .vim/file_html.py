from file_base import FileBase

new = lambda: FileHtml()

class FileHtml(FileBase):

	def __init__(self):
		self._comment = "#"
		self._base = super(FileHtml, self)

	def run(self):
		if super(FileHtml, self).run():
			return
		self.command("!open %")
