helpers do
  def add_breaks(str)
    str.gsub(/(?:\r\n|\r|\n)/, '<br />')
  end
end
