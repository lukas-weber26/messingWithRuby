class Roman
  def self.method_missing name, *args
    puts name.to_s
  end
end

Roman.derp
