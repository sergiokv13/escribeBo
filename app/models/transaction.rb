class Transaction < ActiveRecord::Base
	belongs_to :user
  belongs_to :chapter

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_with AttachmentPresenceValidator, attributes: :image

  has_attached_file :plantilla
  do_not_validate_attachment_file_type :plantilla

  validates :name, :presence => true
  validates :description, :presence => true
  validates :float_amount, :presence => true
  validates :receipt_number, :presence => true

  scope :aproved_transactions, -> { where(aproved: true) }
  scope :pending_transactions, -> { where(aproved: false) }
  
  def status
    if self.aproved? 
      return "Archivada" 
    else 
      return "Pendiente"
    end
  end

  def aprove
    self.aproved = true
    self.float_amount = 0
    self.save
  end

  def self.types
    [
      ['Ingreso', 'Ingreso'], 
      ['Egreso', 'Egreso']
    ]
  end

  def self.concepts
    [
      ['Iniciación','Iniciación'],
      ['Elevación','Elevación'],
      ['Investidura','Investidura'],
      ['Investidura Chevalier','Investidura Chevalier'],
      ['DeMolay Card','DeMolay Card'],
      ['Consultor','Consultor'],
      ['Premiación','Premiación'],
      ['Otro','Otro']
    ]
  end


  def self.balance
    result = 0
    Transaction.aproved_transactions.each do |transaction|
      if transaction.transaction_type == "Ingreso"
        result += transaction.float_amount 
      else
        result -= transaction.float_amount 
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
