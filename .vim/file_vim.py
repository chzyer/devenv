from file_base import FileBase

new = lambda: FileVim()

class FileVim(FileBase):

	def __init__(self):
		self._comment = "\""
		self._base = super(FileVim, self)

	def run(self):
		if self._base.run():
			return
		self.command("source %")
