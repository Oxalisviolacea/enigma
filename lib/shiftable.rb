module Shiftable
  def input_index
    format_input.map.with_index do |letter, index|
      [letter, index, index % 4]
    end
  end

  def shift
    array_without_special_chars.map do |input_array|
      if input_array[2] == 0
        a_shift.fetch(input_array[0])
      elsif input_array[2] == 1
        b_shift.fetch(input_array[0])
      elsif input_array[2] == 2
        c_shift.fetch(input_array[0])
      elsif input_array[2] == 3
        d_shift.fetch(input_array[0])
      end
    end
  end
end
