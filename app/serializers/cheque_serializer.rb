class ChequeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :date, :value_cents, :status

  attribute :date do |object|
    object.date.strftime('%d-%b-%y')
  end
end
