module Server

  class Installed

    def self.yum?
      `which yum` != ""
    end

    def self.brew?
      `which brew` != ""
    end

    def self.nginx?
      `which nginx` != ""
    end

    def self.phpfpm?
      `which php-fpm` != ""
    end

  end

end