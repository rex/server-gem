module Server

  class Conf

    def self.nginx_path
      `which nginx`
    end

    def self.phpfpm_path
      `which php-fpm`
    end

    def self.explain

    end

  end

end