module SpecialCharacters
  def alphabet
    ("a".."z").to_a << " "
  end

  def find_special_chars
    input_index.find_all do |array|
      !alphabet.include?(array[0])
    end
  end

  def array_without_special_chars
    input_index.find_all do |array|
      alphabet.include?(array[0])
    end
  end

  def insert_special_chars
    find_special_chars.flat_map do |array|
      shift.insert(array[1], array[0])
    end
  end
end
