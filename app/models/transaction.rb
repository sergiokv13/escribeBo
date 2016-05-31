class Transaction < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def status
    if self.aproved?
      "Archivada"
    else
      "Pendiente"
    end
  end

  def aprove
    self.aproved = true
    self.save
  end

  def self.pendingTransactions
    Transaction.where(aproved: false)
  end

  def self.aprovedTransactions
    Transaction.where(aproved: true)
  end

  def self.balance
    transactions = Transaction.aprovedTransactions
    result = 0
    transactions.each do |transaction|
      if transaction.transaction_type == "Ingreso"
        result += transaction.mount
      else
        result -= transaction.mount
      end
    end
    result
  end

  def self.find_by_year_and_month(year, month)
    transactions = Transaction.all
    result = Array.new
    transactions.each do |transaction|
      if transaction.created_at.year == year.to_i and transaction.created_at.month == month
        result.push(transaction)
      end
    end
    result
  end

  def self.this_month_results(year, month)
    transactions = Transaction.find_by_year_and_month(year.to_i,month.to_i)
    transactions = transactions.map{ |c| c.user.fullName }
    result = Hash[transactions.group_by {|x| x}.map {|k,v| [k,v.count]}]
  end
end
