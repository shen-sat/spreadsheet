require 'spreadsheet'

file = File.open('./punchout_characters_v2.xls')

book = Spreadsheet.open file

catalogue = {}
book.worksheets.each do |sheet|
	my_hash = {}
	catalogue[sheet.name.to_sym] = my_hash
	sheet.each do |row|
		my_array = []
		my_hash[row[0].to_sym] = my_array unless row[0].nil?
		row.each do |cell|
			my_array.push(cell) unless (cell.nil? || cell == row[0])
		end
	end
end

puts catalogue