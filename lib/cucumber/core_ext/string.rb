class String
  def gzub(pattern, format=nil, &proc)
    s = dup
    md = match(pattern)
    pos = 0
    md.captures.each_with_index do |m, n|
      replacement = if block_given?
        proc.call(m)
      else
        format % m
      end
      s[md.offset(n+1)[0] + pos, m.length] = replacement
      pos += replacement.length - m.length
    end
    s
  end
end
