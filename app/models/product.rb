class Product < ActiveRecord::Base

  %w[rate color company].each do |key|
    define_method(key) do
      properties && properties[key]
    end

    define_method("#{key}=") do |value|
      self.properties = (properties || {}).merge({:"#{key}" => value})
    end
  end
end
