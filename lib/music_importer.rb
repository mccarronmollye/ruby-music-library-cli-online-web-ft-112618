class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    #Globbing files searches for files in a directory with specified file names
  end

  def import
    files.each{ |filename| Song.create_from_filename(filename) }
  end
end
