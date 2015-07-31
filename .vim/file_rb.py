from file_base import FileBase

new = lambda: FileRb()

class FileRb(FileBase):

	def __init__(self):
		self._comment = "#"
		self._base = super(FileRb, self)

	def run(self):
		if super(FileRb, self).run():
			return
		self.command("!ruby %")
