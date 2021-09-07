class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        !!self.freebies.find { |freebie| freebie.item_name == item_name }
    end

    def give_away(dev, freebie)
        if self == freebie.dev
            freebie.update(dev_id: dev.id)
        end
    end
end
