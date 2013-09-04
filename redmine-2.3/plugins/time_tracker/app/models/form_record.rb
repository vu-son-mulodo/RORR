class FormRecord
  include ActiveModel::Validations

  def initialize(options = {})
    if options.blank?
      new_record = true
    else
      new_record = false
    end
    options.each do |key, value|
      method_object = self.method((key + "=").to_sym)
      method_object.call(value)
    end
  end

  def new_record?
    return new_record
  end

  def to_key
  end

  def persisted?
    return false
  end
end