require "fileutils"

module CapybaraWebkitBuilder
  extend self

  def makefile
    system("qmake-qt4")
  end

  def qmake
    system("make qmake")
  end

  def build
    system("make")

    FileUtils.mkdir("bin") unless File.directory?("bin")

    if File.exist?("src/webkit_server.app")
      FileUtils.cp("src/webkit_server.app/Contents/MacOS/webkit_server", "bin", :preserve => true)
    else
      FileUtils.cp("src/webkit_server", "bin", :preserve => true)
    end
  end

  def build_all
    makefile
    qmake
    build
  end
end
