Given(/^the bank statement which contains the entries:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.map_headers!('ENTRY ID' => :id, 'USER ID' => :user_id,'Fecha movimiento' => :posting_date,
                     'Fecha valor' => :value_date, 'Concepto bancario' => :concept, 'Importe' => :amount,
                     'Oficina' => :office, 'Concepto cliente' => :concept1)

  table.map_column!('ENTRY ID') {|id| id.to_i}
  table.map_column!('USER ID') {|user_id| user_id.to_i}
  table.hashes.map{|hash| FactoryGirl.create(:entry, hash)}
end

When(/^the Entries page  is visited$/) do
  visit(entries_index_path)
end

Then(/^the Entries page should content:$/)  do |expected_table|
  # table is a Cucumber::Ast::Table
  rows = find('table#entries').all('tr')
  actual_table = rows.map{ |row| row.all('th, td').map{ |cell| cell.text} }
  expected_table.diff!(actual_table)
end


