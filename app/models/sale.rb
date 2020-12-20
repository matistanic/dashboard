class Sale < ApplicationRecord
    def self.last_sales_12_month
        Sale.where(created_at: 12.months.ago..Date.today)
        .group("strftime('%m-%Y', created_at)")
        .order(created_at: :asc)
        .sum(:amount)
    end

    def self.last_sales_12_month_count
        Sale.where(created_at: 12.months.ago..Date.today)
        .group("strftime('%m-%Y', created_at)")
        .order(created_at: :asc)
        .count
    end


    def self.average_sales_last_12_month
        Sale.where(created_at: 12.months.ago..Date.today)
        .group("strftime('%m-%Y', created_at)")
        .order(created_at: :asc)
        .average(:amount)
    end

    def self.last_sales(months, column)
        Sale.where(created_at: months.months.ago..Date.today)
        .group(column)
        .count
    end

    
end
