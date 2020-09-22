module Shiftable
  def input_index
    format_input.map.with_index do |letter, index|
      [letter, index, index % 4]
    end
  end

  def shift
    shift_array = []
    array_without_special_chars.each do |input_array|
      if input_array[2] == 0
        shift_array << a_shift.fetch(input_array[0])
      elsif input_array[2] == 1
        shift_array << b_shift.fetch(input_array[0])
      elsif input_array[2] == 2
        shift_array << c_shift.fetch(input_array[0])
      elsif input_array[2] == 3
        shift_array << d_shift.fetch(input_array[0])
      end
    end
    shift_array
  end
end
