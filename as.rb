class Parser
    def parse
      puts 'The Parser class received the parse method'
    end
end

class XmlParser
    def initialize(parser)
      @parser = parser
    end
  
    def parse
      @parser.parse
      puts 'An instance of the XmlParser class received the parse message'
    end
end

class JsonParser
    def initialize(parser)
      @parser = parser
    end
  
    def parse
      puts 'An instance of the JsonParser class received the parse message'
      @parser.parse
    end
end


parser = Parser.new

x = XmlParser.new(parser)
j = JsonParser.new(parser)
xj = JsonParser.new(XmlParser.new(parser))

xj.parse