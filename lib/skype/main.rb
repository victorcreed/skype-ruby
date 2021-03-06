module Skype
  @@config = {:app_name => "ruby-skype"}
  def self.config(conf=nil)
    if conf.kind_of? Hash
      conf.each do |k,v|
        @@config[k.to_sym] = v
      end
    else
      return @@config
    end
  end

  def self.method_missing(name, *args)
    self.exec "#{name.to_s.upcase} #{args.join(' ')}"
  end
end
