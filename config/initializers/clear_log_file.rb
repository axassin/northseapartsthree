if Rails.env.development?
  `rake log:clear`
end
puts ' - log file cleared - '