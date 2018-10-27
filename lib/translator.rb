require "yaml"
require 'pry'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_hash = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }
  emoticons.each do | meaning, emoji_array |
    new_hash["get_meaning"][emoji_array[1]] = meaning
    new_hash["get_emoticon"][emoji_array[0]] = emoji_array[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  new_hash = load_library(file_path)
  if new_hash["get_emoticon"][emoticon]
    new_hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  new_hash = load_library(file_path)
  if new_hash["get_meaning"][emoticon]
    new_hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
