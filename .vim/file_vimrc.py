from file_base import FileBase

new = lambda: FileVimrc()

class FileVimrc(FileBase):

	def __init__(self):
		self._comment = "\""
		self._base = super(FileVimrc, self)
