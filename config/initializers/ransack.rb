Ransack.configure do |config|
  config.search_key = :q
  config.add_predicate 'date_equals',
    arel_predicate: 'eq',
    formatter: proc { |v| v.to_date },
    validator: proc { |v| v.present? },
    type: :string
end
