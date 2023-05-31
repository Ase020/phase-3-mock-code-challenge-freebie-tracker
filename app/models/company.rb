class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev:, item_name:, value:)
    Freebie.create(item_name:item_name, dev_id:dev.id, value: value, company_id:self.id)
  end

  def self.oldest_company
    order(:founding_year).first
  end

end
