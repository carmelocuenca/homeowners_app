Given(/^the home owners have the IDs:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.map_headers!('USER ID' => :id, 'Nombre' => :username)

  table.map_column!('USER ID') {|id| id.to_i}
  table.hashes.map{|hash| FactoryGirl.create(:user, hash)}
end