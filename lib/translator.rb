# require modules here
require "yaml"
require "pry"

def load_library(file)
  emoticons = YAML.load_file(file)
  library = {}
  library["get_meaning"] = {}
  library["get_emoticon"] = {}
#library = {"get_meaning" => {jemoticon => word}, "get_emoticon" => {engmoticon => word}}

  emoticons.each do |word,symbols|
    library["get_meaning"][symbols[1]] = word
    library["get_emoticon"][symbols[0]] = symbols[1]
  end
  
  library
end

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)

  if library["get_emoticon"].key?(emoticon)
    library["get_emoticon"].each do |engmoticon, nipponicon|
      if engmoticon == emoticon
        return nipponicon
      end
    end
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  library = load_library(file)

  if library["get_meaning"].key?(emoticon)
    library["get_meaning"].each do |nipponicon, meaning|
      if nipponicon == emoticon
        return meaning
      end
    end
  else
    return "Sorry, that emoticon was not found"
  end
end