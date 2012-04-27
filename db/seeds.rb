table_names = %w(announcements groups)
table_names.each do |table_name|
  dir = case Rails.env
  when 'development', 'staging'
    'development'
  when 'production'
    'production'
  end
  path = Rails.root.join('db', 'seeds', dir, "#{table_name}.rb")
  if File.exist?(path)
    puts "Creating #{table_name}..."
    require(path)
  end
end