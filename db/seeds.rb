require 'active_record/fixtures'

fixtures_dir = File.join(Rails.root, '/db/seeds')

Dir.glob(File.join(fixtures_dir,'*.yml')).each do |file|
  base_name = File.basename(file, '.*')
  ActiveRecord::FixtureSet.create_fixtures(fixtures_dir, base_name)
end

user = User.new
user.email = 'adam_ruby@126.com'
puts ENV['adam_password']
user.password = ENV['adam_password']
user.password_confirmation = ENV['adam_password']
user.save!

user.check_cards = CheckCard.all
user.save!
