require 'spreadsheet'

book = Spreadsheet.open 'C:/Users/Shen/Desktop/Workspace/spreadsheet/punchout_characters_v2.xls'

catalogue = {}
book.worksheets.each do |sheet|
	catalogue[sheet.name.to_sym] = {}
	sheet.each do |row|
		catalogue[sheet.name.to_sym][row[0].to_sym] = [] unless row[0].nil?
		row.each do |cell|
			catalogue[sheet.name.to_sym][row[0].to_sym].push(cell) unless (cell.nil? || cell == row[0])
		end
	end
end

puts catalogue