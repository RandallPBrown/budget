class SampleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :string_data,
             :text_data,
             :json_data,
             :boolean_data,
             :integer_data
end
