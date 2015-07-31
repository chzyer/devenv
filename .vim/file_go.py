from file_base import FileBase

import sys
import os

new = lambda: FileGo()

class FileGo(FileBase):

	def __init__(self):
		self._base = super(FileGo, self)
		self._comment = "//"

	def set_gopath(self, command):
		real_path = os.path.abspath(".") + "/"
		idx = real_path.find("/src/")
		if idx > 0:
			command.append("export GOPATH=${GOPATH}:%s" % real_path[:idx])
		else:
			command.append("export GOPATH=${GOPATH}:%s" % real_path)
		return real_path[idx+5:].rstrip("/")

	def test2(self):
		self.save()
		command = []
		pkg = self.set_gopath(command)
		command.append("go test -v -coverprofile=/tmp/gotest.out %s" % pkg)
		command.append("go tool cover -html=/tmp/gotest.out")
		command.append("rm /tmp/gotest.out")
		self.command("!" + " && ".join(command))

	def test(self):
		self.save()
		command = []
		pkg = self.set_gopath(command)
		command.append("go test -v -coverprofile=/tmp/gotest.out %s" % pkg)
		command.append("go tool cover -func=/tmp/gotest.out | grep -v '100.0\%'")
		command.append("rm /tmp/gotest.out")
		self.command("!" + " && ".join(command))

	def run(self):
		cover = False
		command = []
		path = os.path.abspath(".")
		pkg = self.set_gopath(command)
		print pkg
		if self._base.run():
			return
		package = self.findone(r'package (\w+)')
		if package == "main":
			command.append("go run %")
		else:
			command.append("go test -i %s" % (pkg))
			if cover:
				command.append("go test -v -coverprofile=/tmp/gotest.out -benchmem %s" % pkg )
				command.append("echo -n "" > /tmp/gotest")
				command.append("cat /tmp/gotest.out| while read a; do echo ${a//_$(pwd)/.} >> /tmp/gotest; done")
				command.append("go tool cover -func=/tmp/gotest | grep -v '100.0\%'")
			else:
				command.append("go test -v %s" % (pkg))
		self.command("!" + " && ".join(command))

	def build(self):
		command = []
		path = os.path.abspath(".")
		self.set_gopath(command)
		if self._base.build():
			return
		command.append("go build .")
		self.command("!" + " && ".join(command))
