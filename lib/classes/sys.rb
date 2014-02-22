class Sys

  def self.yum_available?
    `which yum` != ""
  end

  def self.brew_available?
    `which brew` != ""
  end

end